load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/shea_util.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

begin

;********** control part **********

; We generate plots, but what kind do we prefer?
;  type = "x11"
; type = "eps"
 type = "png"

  slat =   22.0 
  elat =   48.0
  slon =  120
  elon =  160 
  clat = (elat-slat)*0.5
  clon = (elon-slon)*0.5

  s_yyyy = 2016
  s_mm   = 01
  s_dd   = 02
  s_hh   = 00
  
  e_yyyy = 2016
  e_mm   = 01
  e_dd   = 03
  e_hh   = 00


  dirc = "/Volumes/RAID01/research/DATA/ERA-interim/"

  f_rv    = addfile (dirc+"ERA_interim-tropics-0125deg-plev-201601-Vorticity.nc.nc", "r"); note the "s" of addfile

  lat  = f_rv->latitude
  lon  = f_rv->longitude
  time = f_rv->time
  rv   = f_rv->vo

 ;
 ; Convert to UTC time.
 ;
   utc_date = cd_calendar(time, 0)

   do ii = 0, dimsizes(time)-1,1
     if(s_yyyy.eq.utc_date(ii,0).and.s_mm.eq.utc_date(ii,1).and.s_dd.eq.utc_date(ii,2).and.s_hh.eq.utc_date(ii,3))then
       s_ii = ii
     else if(e_yyyy.eq.utc_date(ii,0).and.e_mm.eq.utc_date(ii,1).and.e_dd.eq.utc_date(ii,2).and.e_hh.eq.utc_date(ii,3))then
       e_ii = ii
     end if
     end if

   end do

;************************************************
; create default plot
;************************************************
  wks = gsn_open_wks("png","erainterim")              ; send graphics to PNG file

  res                       = True               ; plot mods desired

  res@mpMinLatF              =  -20.0
  res@mpMaxLatF              =   20.0
  res@mpMinLonF              =  150
  res@mpMaxLonF              =  210
  res@tiYAxisFontHeightF  = 0.025                             ; default 
  res@tiXAxisFontHeightF  = 0.025                             ; default 



  res@cnFillOn              = True               ; turn on color fill
  res@cnFillPalette         = "BlAqGrYeOrRe"     ; set color map
  res@cnLinesOn             = False              ; turn off contour lines

  plot = gsn_csm_contour_map(wks,rv(s_ii,0,:,:),res)     


exit
end

