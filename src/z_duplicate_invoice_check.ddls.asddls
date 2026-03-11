@AbapCatalog.sqlViewName: 'Z_DUP_INV'
@EndUserText.label: 'Duplicate Invoice Check'

define view Z_Duplicate_Invoice_Check
as select from BKPF
inner join BSEG
on BKPF.BELNR = BSEG.BELNR
and BKPF.BUKRS = BSEG.BUKRS
and BKPF.GJAHR = BSEG.GJAHR
{
BKPF.BUKRS,
BSEG.LIFNR,
BKPF.XBLNR,
BSEG.DMBTR,
BKPF.WAERS,
BKPF.BUDAT
}
where
BKPF.BUDAT >= add_days(current_date, -90)
and BKPF.STBLG is initial