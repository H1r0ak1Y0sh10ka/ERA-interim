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

  yyyy = 2015
  mm   = 04
  dd   = 15
  hh   = 00
  
  dirc = "/Volumes/RAID01/research/DATA/ERA-interim/ayumi/"

  f_mslp    = addfiles (dirc+"ayumi-mslp.nc", "r"); note the "s" of addfile
  f_t2m     = addfiles (dirc+"ayumi-T2m.nc", "r") ; note the "s" of addfile
  f_T       = addfiles (dirc+"ayumi-T.nc", "r")   ; note the "s" of addfile
  f_U       = addfiles (dirc+"ayumi-U.nc", "r")   ; note the "s" of addfile
  f_V       = addfiles (dirc+"ayumi-V.nc", "r")   ; note the "s" of addfile
  f_Q       = addfiles (dirc+"ayumi-Q.nc", "r")   ; note the "s" of addfile
 
  v_name =getfilevarnames (f_mslp)
 ; print(f_mslp)

  lat= f_mslp->latitude
  ;lon= f_mslp->longitude
  ;time= f_mslp->time

  ;mslp= f_mslp->msl
  ;t2m= f_t2m->t2m



exit
end

