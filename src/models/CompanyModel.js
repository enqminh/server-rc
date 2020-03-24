/**
 * @Created by MinJa 
 * on 08/03/2020.
 */

'use strict';

const db = require("../database/db");

const Company = function (company) {
    this.full_name = company.full_name;
    this.email = company.email;
    this.phone = company.phone;
    this.job_id = company.job_id;
    this.province_id = company.province_id;
    this.address = company.address;
    this.member_total = company.member_total;
    this.website = company.website;
    this.date_add = new Date();
    this.short_name = company.short_name;
}

Company.create = function (company, result) {
    let sql = 'INSERT INTO rc_companys SET ?'
    db.query(sql, [company], (err, response) => {
        if (err) {
            result(err, null);
            return;
        } else {
            result(null, { company_id: response.insertId, ...company });
        }
    })
}
Company.getAll = function (queryData, result) {
    console.log(queryData);

    var { page, row, job_id, province_id, company_name } = queryData

    const limit = (page - 1) * row + ',' + row;
    const active = 1;

    // if (company_name == null || company_name == undefined || company_name == '') {
    //     company_name = 'xxx'
    // }

    var sql = "SELECT * FROM rc_companys WHERE active = ?"
    if (job_id > 0) {
        sql += ` AND job_id = ${job_id}`;
    }
    if (province_id > 0) {
        sql += ` AND province_id = ${province_id}`;
    }
    sql += " ORDER BY full_name ASC";

    // if (company_name) {
    //     sql += ` AND company_name = ${province_id}`;
    // }
    if (page && row) {
        sql += ` LIMIT ${limit}`;
    }

    db.query(sql, [active], (err, response) => {
        if (err) {
            result(null, err);
            return;
        }
        result(null, response);
    })
}
Company.findById = function (companyId, result) {
    let sql = 'SELECT * FROM rc_companys WHERE company_id = ?'
    db.query(sql, [companyId], (err, response) => {
        if (err) {
            result(err, null);
            return;
        }
        if (response.length) {
            result(null, response[0]);
            return;
        }
        // not found company with the id
        result({ kind: "not_found" }, null);
    })
}
Company.updateById = function (companyId, company, result) {
    let sql = 'UPDATE rc_companys SET ? WHERE company_id = ?'
    db.query(sql, [company, companyId], (err, response) => {
        if (err) {
            result(null, err);
            return;
        }
        if (response.affectedRows == 0) {
            // not found company with the id
            result({ kind: "not_found" }, null);
            return;
        }
        result(null, { company_id: companyId, ...company });
    })
}
Company.remove = function (companyId, result) {
    let sql = 'DELETE FROM rc_companys WHERE company_id = ?';
    db.query(sql, [companyId], (err, response) => {
        if (err) {
            result(null, err);
            return;
        }
        if (response.affectedRows == 0) {
            // not found company with the id
            result({ kind: "not_found" }, null);
            return;
        }
        result(null, response);
    })
}
module.exports = Company;