from fastapi import APIRouter
from config.db import conn
from models.report import reports
from schemas.report import Report

report = APIRouter()

@report.get('/reports/')
def fetch_reports():
    return conn.execute(reports.select()).fetchall()

@report.post('/reports/')
def post_report(report: Report):
    return conn.execute(reports.insert().values(pos_id=report.pos_id))

@report.put('/reports/{id}')
def update_report(id: int,report: Report):
    return conn.execute(reports.update().values(pos_id=report.pos_id).where(reports.c.rep_id == id))

@report.delete('/reports/{id}')
def delete_report(id: int):
    return conn.execute(reports.delete().where(reports.c.rep_id == id))