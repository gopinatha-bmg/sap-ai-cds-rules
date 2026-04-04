@AbapCatalog.sqlViewName: 'Z_DUP_INV_1'
@EndUserText.label: 'Duplicate Invoice Check 1'
@OData.publish: true

define view Z_Duplicate_Invoice_Check_1
as select from bkpf
inner join bseg
on bkpf.belnr = bseg.belnr
and bkpf.bukrs = bseg.bukrs
and bkpf.gjahr = bseg.gjahr
{
  key bkpf.belnr,
  bkpf.bukrs,
  bseg.lifnr,
  bkpf.xblnr,
  bseg.dmbtr,
  bkpf.waers,
  bkpf.budat
}
where
  bkpf.budat >= dats_add_days( cast( $session.system_date as abap.dats ), -90 , 'NULL')
  and bkpf.stblg is initial
  and bseg.lifnr is not initial
  and bkpf.xblnr is not initial
