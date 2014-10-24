
# add path
export PATH=${PATH}:$SCT_DIR/dev/template_creation

#ALT

sct_crop_image -i ALT_t2.nii.gz -o ALT_t2_crop.nii.gz -start 0 -end 533 -dim 2

sct_propseg -i ALT_t2_crop.nii.gz -t t2 -centerline-binary

sct_generate_centerline.py -i mask-up.nii.gz -o up.nii.gz

fslmaths ALT_t2_crop_centerline.nii.gz -add up.nii.gz semi.nii.gz

fslmaths semi.nii.gz -add mask-down.nii.gz full_centerline.nii.gz

sct_straighten_spinalcord -i ALT_t2_crop.nii.gz -c full_centerline.nii.gz -v 2

WarpImageMultiTransform 3 full_centerline.nii.gz centerline_straight.nii.gz -R ALT_t2_crop_straight.nii.gz warp_curve2straight.nii.gz

sct_detect_extrema.py -i centerline_straight.nii.gz

sct_crop_image -i ALT_t2_crop_straight.nii.gz -o ALT_t2_crop_straight_crop.nii.gz -dim 2 -start 30 -end 576

sct_create_cross.py -i ALT_t2_crop_straight_crop.nii.gz -x 51 -y 162

sct_push_into_template_space.py -i ALT_t2_crop_straight_crop.nii.gz -n landmark_native.nii.gz 

sct_crop_image -i centerline_straight.nii.gz -o centerline_straight_crop.nii.gz -dim 2 -start 30 -end 576

sct_create_cross.py -i centerline_straight_crop.nii.gz -x 51 -y 162

sct_push_into_template_space.py -i centerline_straight_crop.nii.gz -n landmark_native.nii.gz 



#JD

sct_crop_image -i JD_t2.nii.gz -o JD_t2_crop.nii.gz -dim 2 -start 0 -end 545 

sct_propseg -i JD_t2_crop.nii.gz -t t2 -centerline-binary -init-mask init.nii.gz

sct_erase_centerline.py -i JD_t2_crop_centerline.nii.gz -s 371 -e 415

sct_generate_centerline.py -i up.nii.gz -o cup.nii.gz

sct_generate_centerline.py -i down.nii.gz -o cdown.nii.gz

fslmaths centerline_erased.nii.gz -add cup.nii.gz semi.nii.gz

fslmaths semi.nii.gz -add cdown.nii.gz full_centerline.nii.gz

sct_straighten_spinalcord -i JD_t2_crop.nii.gz -c full_centerline.nii.gz -v 2

WarpImageMultiTransform 3 full_centerline.nii.gz centerline_straight.nii.gz -R JD_t2_crop_straight.nii.gz warp_curve2straight.nii.gz 

sct_detect_extrema.py -i centerline_straight.nii.gz 

sct_crop_image -i JD_t2_crop_straight.nii.gz -o JD_t2_crop_straight_crop.nii.gz -dim 2 -start 30 -end 585

sct_create_cross.py -i JD_t2_crop_straight_crop.nii.gz -x 54 -y 162

sct_push_into_template_space.py -i JD_t2_crop_straight_crop.nii.gz -n landmark_native.nii.gz

sct_crop_image -i centerline_straight.nii.gz -o centerline_straight_crop.nii.gz -dim 2 -start 30 -end 585

sct_create_cross.py -i centerline_straight_crop.nii.gz -x 54 -y 162

sct_push_into_template_space.py -i centerline_straight_crop.nii.gz -n landmark_native.nii.gz 

#JW

sct_crop_image -i JW_t2.nii.gz -o JW_t2_crop.nii.gz -dim 2 -start 0 -end 516

sct_propseg -i JW_t2_crop.nii.gz -t t2 -centerline-binary

sct_erase_centerline.py -i JW_t2_crop_centerline.nii.gz -s 284 -e 449

sct_generate_centerline.py -i up.nii.gz -o cup.nii.gz

sct_generate_centerline.py -i down.nii.gz -o cdown.nii.gz

fslmaths centerline_erased.nii.gz -add cup.nii.gz semi.nii.gz

fslmaths semi.nii.gz -add cdown.nii.gz full_centerline.nii.gz

sct_straighten_spinalcord -i JW_t2_crop.nii.gz -c full_centerline.nii.gz -v 2

WarpImageMultiTransform 3 full_centerline.nii.gz centerline_straight.nii.gz -R JW_t2_crop_straight.nii.gz warp_curve2straight.nii.gz 

sct_detect_extrema.py -i centerline_straight.nii.gz 

sct_crop_image -i JW_t2_crop_straight.nii.gz -o JW_t2_crop_straight_crop.nii.gz -dim 2 -start 29 -end 551

sct_create_cross.py -i JW_t2_crop_straight_crop.nii.gz -x 56 -y 160

sct_push_into_template_space.py -i JW_t2_crop_straight_crop.nii.gz -n landmark_native.nii.gz 

sct_crop_image -i centerline_straight.nii.gz -o centerline_straight_crop.nii.gz -dim 2 -start 29 -end 551

sct_create_cross.py -i centerline_straight_crop.nii.gz -x 56 -y 160

sct_push_into_template_space.py -i centerline_straight_crop.nii.gz -n landmark_native.nii.gz 

#MT
sct_crop_image -i MT_t2.nii.gz -o MT_t2_crop.nii.gz -dim 2 -start 0 -end 515

sct_propseg -i MT_t2_crop.nii.gz -t t2 -centerline-binary -init-centerline init.nii.gz

sct_generate_centerline.py -i down.nii.gz -o cdown.nii.gz

sct_generate_centerline.py -i up.nii.gz -o cup.nii.gz

fslmaths MT_t2_crop_centerline.nii.gz -add cup.nii.gz semi.nii.gz

fslmaths semi.nii.gz -add cdown.nii.gz full_centerline.nii.gz

sct_straighten_spinalcord -i MT_t2_crop.nii.gz -c full_centerline.nii.gz -v 2

WarpImageMultiTransform 3 full_centerline.nii.gz centerline_straight.nii.gz -R MT_t2_crop_straight.nii.gz warp_curve2straight.nii.gz 

sct_detect_extrema.py -i centerline_straight.nii.gz

sct_crop_image -i MT_t2_crop_straight.nii.gz -o MT_t2_crop_straight_crop.nii.gz -dim 2 -start 30 -end 558

sct_create_cross.py -i MT_t2_crop_straight_crop.nii.gz -x 56 -y 161

sct_push_into_template_space.py -i MT_t2_crop_straight_crop.nii.gz -n landmark_native.nii.gz 

sct_crop_image -i centerline_straight.nii.gz -o centerline_straight_crop.nii.gz -dim 2 -start 30 -end 558

sct_create_cross.py -i centerline_straight_crop.nii.gz -x 56 -y 161

sct_push_into_template_space.py -i centerline_straight_crop.nii.gz -n landmark_native.nii.gz 

#T047

sct_crop_image -i T047_t2.nii.gz -o T047_t2_crop.nii.gz -start 0 -end 553 -dim 2

sct_propseg -i T047_t2_crop.nii.gz -t t2 -centerline-binary

sct_generate_centerline.py -i up.nii.gz -o cup.nii.gz

sct_generate_centerline.py -i down.nii.gz -o cdown.nii.gz

fslmaths T047_t2_crop_centerline.nii.gz -add cup.nii.gz semi.nii.gz

fslmaths semi.nii.gz -add cdown.nii.gz full_centerline.nii.gz

sct_straighten_spinalcord -i T047_t2_crop.nii.gz -c full_centerline.nii.gz -v 2

WarpImageMultiTransform 3 full_centerline.nii.gz centerline_straight.nii.gz -R T047_t2_crop_straight.nii.gz warp_curve2straight.nii.gz 

sct_detect_extrema.py -i centerline_straight.nii.gz

sct_crop_image -i T047_t2_crop_straight.nii.gz -o T047_t2_crop_straight_crop.nii.gz -dim 2 -start 30 -end 588 

sct_create_cross.py -i T047_t2_crop_straight_crop.nii.gz -x 55 -y 160

sct_push_into_template_space.py -i T047_t2_crop_straight_crop.nii.gz -n landmark_native.nii.gz 

sct_crop_image -i centerline_straight.nii.gz -o centerline_straight_crop.nii.gz -dim 2 -start 30 -end 588

sct_create_cross.py -i centerline_straight_crop.nii.gz -x 55 -y 160

sct_push_into_template_space.py -i centerline_straight_crop.nii.gz -n landmark_native.nii.gz 

#VG

sct_crop_image -i VG_t2.nii.gz -o VG_t2.nii.gz -dim 1 -start 11 -end 246

sct_crop_image -i VG_t2.nii.gz -o VG_t2_crop.nii.gz -dim 2 -start 71 -end 549

sct_propseg -i VG_t2_crop.nii.gz -t t2 -centerline-binary

sct_erase_centerline.py -i VG_t2_crop_centerline.nii.gz -s 0 -e 59

sct_erase_centerline.py -i centerline_erased.nii.gz -s 350 -e 478

sct_generate_centerline.py -i up.nii.gz -o cup.nii.gz

sct_generate_centerline.py -i down.nii.gz -o cdown.nii.gz

fslmaths centerline_erased.nii.gz -add cup.nii.gz semi.nii.gz

fslmaths semi.nii.gz -add cdown.nii.gz full_centerline.nii.gz
 
sct_straighten_spinalcord -i VG_t2_crop.nii.gz -c full_centerline.nii.gz -v 2

WarpImageMultiTransform 3 full_centerline.nii.gz centerline_straight.nii.gz -R VG_t2_crop_straight.nii.gz warp_curve2straight.nii.gz 

sct_detect_extrema.py -i centerline_straight.nii.gz

sct_crop_image -i VG_t2_crop_straight.nii.gz -o VG_t2_crop_straight_crop.nii.gz -dim 2 -start 30 -end 517 

sct_create_cross.py -i VG_t2_crop_straight_crop.nii.gz -x 55 -y 149

sct_push_into_template_space.py -i VG_t2_crop_straight_crop.nii.gz -n landmark_native.nii.gz 

sct_crop_image -i centerline_straight.nii.gz -o centerline_straight_crop.nii.gz -dim 2 -start 30 -end 517

sct_create_cross.py -i centerline_straight_crop.nii.gz -x 55 -y 149

sct_push_into_template_space.py -i centerline_straight_crop.nii.gz -n landmark_native.nii.gz 


#VP

sct_crop_image -i VP_t2.nii.gz -dim 2 -start 0 -end 528 -o VP_t2_crop.nii.gz 

sct_propseg -i VP_t2_crop.nii.gz -t t2 -centerline-binary -init-mask mask.nii.gz 

sct_erase_centerline.py -i VP_t2_crop_centerline.nii.gz -s 353 -e 528

sct_generate_centerline.py -i down.nii.gz -o cdown.nii.gz

sct_generate_centerline.py -i up.nii.gz -o cup.nii.gz

fslmaths centerline_erased.nii.gz -add cup.nii.gz semi.nii.gz

fslmaths semi.nii.gz -add cdown.nii.gz full_centerline.nii.gz

sct_straighten_spinalcord -i VP_t2_crop.nii.gz -c full_centerline.nii.gz -v 2

WarpImageMultiTransform 3 full_centerline.nii.gz centerline_straight.nii.gz -R VP_t2_crop_straight.nii.gz warp_curve2straight.nii.gz 

sct_detect_extrema.py -i centerline_straight.nii.gz

sct_crop_image -i VP_t2_crop_straight.nii.gz -o VP_t2_crop_straight_crop.nii.gz -dim 2 -start 29 -end 565

sct_create_cross.py -i VP_t2_crop_straight_crop.nii.gz -x 55 -y 161

sct_push_into_template_space.py -i VP_t2_crop_straight_crop.nii.gz -n landmark_native.nii.gz 

sct_crop_image -i centerline_straight.nii.gz -o centerline_straight_crop.nii.gz -dim 2 -start 29 -end 565

sct_create_cross.py -i centerline_straight_crop.nii.gz -x 55 -y 161

sct_push_into_template_space.py -i centerline_straight_crop.nii.gz -n landmark_native.nii.gz 

# VC 

sct_crop_image -i VC_t2.nii.gz -o VC_t2.nii.gz -dim 1 -start 11 -end 245

sct_crop_image -i VC_t2.nii.gz -o VC_t2_crop.nii.gz -dim 2 -start 67 -end 589

sct_propseg -i VC_t2_crop.nii.gz -t t2 -centerline-binary -init-mask init.nii.gz 

sct_erase_centerline.py -i VC_t2_crop_centerline.nii.gz -s 0 -e 72

sct_generate_centerline.py -i up.nii.gz -o cup.nii.gz

sct_generate_centerline.py -i down.nii.gz -o cdown.nii.gz

fslmaths centerline_erased.nii.gz -add cup.nii.gz semi.nii.gz

fslmaths semi.nii.gz -add cdown.nii.gz full_centerline.nii.gz

sct_straighten_spinalcord -i VC_t2_crop.nii.gz -c full_centerline.nii.gz -v 2

WarpImageMultiTransform 3 full_centerline.nii.gz centerline_straight.nii.gz -R VC_t2_crop_straight.nii.gz warp_curve2straight.nii.gz 

sct_detect_extrema.py -i centerline_straight.nii.gz

sct_crop_image -i VC_t2_crop_straight.nii.gz -o VC_t2_crop_straight_crop.nii.gz -dim 2 -start 29 -end 558

sct_create_cross.py -i VC_t2_crop_straight_crop.nii.gz -x 54 -y 150

sct_push_into_template_space.py -i VC_t2_crop_straight_crop.nii.gz -n landmark_native.nii.gz 

sct_crop_image -i centerline_straight.nii.gz -o centerline_straight_crop.nii.gz -dim 2 -start 29 -end 558

sct_create_cross.py -i centerline_straight_crop.nii.gz -x 54 -y 150

sct_push_into_template_space.py -i centerline_straight_crop.nii.gz -n landmark_native.nii.gz 


#errsm02

sct_crop_image -i errsm_02_t2.nii.gz -o errsm_02_t2_crop.nii.gz -dim 2 -start 100 -end 620

sct_propseg -i errsm_02_t2_crop.nii.gz -t t2 -centerline-binary -init-centerline cen.nii.gz 

sct_erase_centerline.py -i errsm_02_t2_crop_centerline.nii.gz -s 345 -e 520

sct_generate_centerline.py -i up.nii.gz -o cup.nii.gz

sct_generate_centerline.py -i down.nii.gz -o cdown.nii.gz

fslmaths centerline_erased.nii.gz -add cup.nii.gz semi.nii.gz

fslmaths semi.nii.gz -add cdown.nii.gz full_centerline.nii.gz

sct_straighten_spinalcord -i errsm_02_t2_crop.nii.gz -c full_centerline.nii.gz -v 2

WarpImageMultiTransform 3 full_centerline.nii.gz centerline_straight.nii.gz -R errsm_02_t2_crop_straight.nii.gz warp_curve2straight.nii.gz 

sct_detect_extrema.py -i centerline_straight.nii.gz 

sct_crop_image -i errsm_02_t2_crop_straight.nii.gz -o errsm_02_t2_crop_straight_crop.nii.gz -dim 2 -start 29 -end 559

sct_create_cross.py -i errsm_02_t2_crop_straight_crop.nii.gz -x 54 -y 147

sct_push_into_template_space.py -i errsm_02_t2_crop_straight_crop.nii.gz -n landmark_native.nii.gz 

sct_crop_image -i centerline_straight.nii.gz -o centerline_straight_crop.nii.gz -dim 2 -start 29 -end 559

sct_create_cross.py -i centerline_straight_crop.nii.gz -x 54 -y 147

sct_push_into_template_space.py -i centerline_straight_crop.nii.gz -n landmark_native.nii.gz 

#errsm_04 

sct_crop_image -i errsm_04_t2.nii.gz -o errsm_04_t2_crop.nii.gz -dim 2 -start 73 -end 549

sct_propseg -i errsm_04_t2_crop.nii.gz -t t2 -centerline-binary

sct_erase_centerline.py -i errsm_04_t2_crop_centerline.nii.gz -s 400 -e 476

fslmaths centerline_erased.nii.gz -add down.nii.gz semi.nii.gz

sct_generate_centerline.py -i up.nii.gz -o cup.nii.gz

fslmaths semi.nii.gz -add cup.nii.gz full_centerline.nii.gz

sct_straighten_spinalcord -i errsm_04_t2_crop.nii.gz -c full_centerline.nii.gz -v 2

WarpImageMultiTransform 3 full_centerline.nii.gz centerline_straight.nii.gz -R errsm_04_t2_crop_straight.nii.gz warp_curve2straight.nii.gz 

sct_detect_extrema.py -i centerline_straight.nii.gz 

sct_crop_image -i errsm_04_t2_crop_straight.nii.gz -o errsm_04_t2_crop_straight_crop.nii.gz -dim 2 -start 30 -end 516

sct_create_cross.py -i errsm_04_t2_crop_straight_crop.nii.gz -x 65 -y 231

sct_push_into_template_space.py -i errsm_04_t2_crop_straight_crop.nii.gz -n landmark_native.nii.gz 

sct_crop_image -i centerline_straight.nii.gz -o centerline_straight_crop.nii.gz -dim 2 -start 29 -end 559

sct_create_cross.py -i centerline_straight_crop.nii.gz -x 65 -y 231

sct_push_into_template_space.py -i centerline_straight_crop.nii.gz -n landmark_native.nii.gz 


#errsm_26

sct_crop_image -i errsm_26_t2.nii.gz -o errsm_26_t2_crop.nii.gz -dim 2 -start 72 -end 568

sct_propseg -i errsm_26_t2_crop.nii.gz -t t2 -centerline-binary -init-mask init.nii.gz 

sct_erase_centerline.py -i errsm_26_t2_crop_centerline.nii.gz -s 432 -e 496

sct_generate_centerline.py -i up.nii.gz -o cup.nii.gz

fslmaths centerline_erased.nii.gz -add cup.nii.gz full_centerline.nii.gz 

sct_straighten_spinalcord -i errsm_26_t2_crop.nii.gz -c full_centerline.nii.gz -v 2

WarpImageMultiTransform 3 full_centerline.nii.gz centerline_straight.nii.gz -R errsm_26_t2_crop_straight.nii.gz warp_curve2straight.nii.gz 

sct_detect_extrema.py -i centerline_straight.nii.gz 

sct_crop_image -i errsm_26_t2_crop_straight.nii.gz -o errsm_26_t2_crop_straight_crop.nii.gz -dim 2 -start 29 -end 534

sct_create_cross.py -i errsm_26_t2_crop_straight_crop.nii.gz -x 55 -y 222

sct_push_into_template_space.py -i errsm_26_t2_crop_straight_crop.nii.gz -n landmark_native.nii.gz 

sct_crop_image -i centerline_straight.nii.gz -o centerline_straight_crop.nii.gz -dim 2 -start 29 -end 534

sct_create_cross.py -i centerline_straight_crop.nii.gz -x 55 -y 222

sct_push_into_template_space.py -i centerline_straight_crop.nii.gz -n landmark_native.nii.gz 

#errsm_31

sct_crop_image -i errsm_31_t2.nii.gz -o errsm_31_t2_crop.nii.gz -dim 2 -start 0 -end 593

sct_propseg -i errsm_31_t2_crop.nii.gz -t t2 -centerline-binary

sct_erase_centerline.py -i errsm_31_t2_crop_centerline.nii.gz -s 0 -e 141

sct_generate_centerline.py -i up.nii.gz -o cup.nii.gz

sct_generate_centerline.py -i down.nii.gz -o cdown.nii.gz 

fslmaths centerline_erased.nii.gz -add cup.nii.gz semi.nii.gz

fslmaths semi.nii.gz -add cdown.nii.gz full_centerline.nii.gz

sct_straighten_spinalcord -i errsm_31_t2_crop.nii.gz -c full_centerline.nii.gz -v 2

WarpImageMultiTransform 3 full_centerline.nii.gz centerline_straight.nii.gz -R errsm_31_t2_crop_straight.nii.gz warp_curve2straight.nii.gz 

sct_detect_extrema.py -i centerline_straight.nii.gz 

sct_crop_image -i errsm_31_t2_crop_straight.nii.gz -o errsm_31_t2_crop_straight_crop.nii.gz -dim 2 -start 30 -end 627

sct_create_cross.py -i errsm_31_t2_crop_straight_crop.nii.gz -x 55 -y 223

sct_push_into_template_space.py -i errsm_31_t2_crop_straight_crop.nii.gz -n landmark_native.nii.gz 

sct_crop_image -i centerline_straight.nii.gz -o centerline_straight_crop.nii.gz -dim 2 -start 30 -end 627

sct_create_cross.py -i centerline_straight_crop.nii.gz -x 55 -y 223

sct_push_into_template_space.py -i centerline_straight_crop.nii.gz -n landmark_native.nii.gz 


# errsm_32

sct_crop_image -i errsm_32_t2.nii.gz -o errsm_32_t2_crop.nii.gz -dim 2 -start 0 -end 552

sct_propseg -i errsm_32_t2_crop.nii.gz -t t2 -centerline-binary -init-mask init.nii.gz 

sct_erase_centerline.py -i errsm_32_t2_crop_centerline.nii.gz -s 56 -e 94

sct_erase_centerline.py -i centerline_erased.nii.gz -s 392 -e 552

sct_generate_centerline.py -i up.nii.gz -o cup.nii.gz

sct_generate_centerline.py -i down.nii.gz -o cdown.nii.gz

fslmaths centerline_erased.nii.gz -add cup.nii.gz semi.nii.gz

fslmaths semi.nii.gz -add cdown.nii.gz full_centerline.nii.gz

sct_straighten_spinalcord -i errsm_32_t2_crop.nii.gz -c full_centerline.nii.gz -v 2

WarpImageMultiTransform 3 full_centerline.nii.gz centerline_straight.nii.gz -R errsm_32_t2_crop_straight.nii.gz warp_curve2straight.nii.gz 

sct_detect_extrema.py -i centerline_straight.nii.gz 

sct_crop_image -i errsm_32_t2_crop_straight.nii.gz -o errsm_32_t2_crop_straight_crop.nii.gz -dim 2 -start 29 -end 589

sct_create_cross.py -i errsm_32_t2_crop_straight_crop.nii.gz -x 52 -y 225

sct_push_into_template_space.py -i errsm_32_t2_crop_straight_crop.nii.gz -n landmark_native.nii.gz 

sct_crop_image -i centerline_straight.nii.gz -o centerline_straight_crop.nii.gz -dim 2 -start 29 -end 589

sct_create_cross.py -i centerline_straight_crop.nii.gz -x 52 -y 225

sct_push_into_template_space.py -i centerline_straight_crop.nii.gz -n landmark_native.nii.gz 

# errsm_33

sct_crop_image -i errsm_33_t2.nii.gz -o errsm_33_t2_crop.nii.gz -dim 2 -start 0 -end 548

sct_propseg -i errsm_33_t2_crop.nii.gz -t t2 -centerline-binary 

sct_erase_centerline.py -i errsm_33_t2_crop_centerline.nii.gz -s 0 -e 157

sct_erase_centerline.py -i centerline_erased.nii.gz -s 364 -e 548

sct_generate_centerline.py -i up.nii.gz -o cup.nii.gz

sct_generate_centerline.py -i down.nii.gz -o cdown.nii.gz

fslmaths centerline_erased.nii.gz -add cup.nii.gz semi.nii.gz

fslmaths semi.nii.gz -add cdown.nii.gz full_centerline.nii.gz

sct_straighten_spinalcord -i errsm_33_t2_crop.nii.gz -c full_centerline.nii.gz -v 2

WarpImageMultiTransform 3 full_centerline.nii.gz centerline_straight.nii.gz -R errsm_33_t2_crop_straight.nii.gz warp_curve2straight.nii.gz 

sct_detect_extrema.py -i centerline_straight.nii.gz 

sct_crop_image -i errsm_33_t2_crop_straight.nii.gz -o errsm_33_t2_crop_straight_crop.nii.gz -dim 2 -start 29 -end 587

sct_create_cross.py -i errsm_33_t2_crop_straight_crop.nii.gz -x 55 -y 225

sct_push_into_template_space.py -i errsm_33_t2_crop_straight_crop.nii.gz -n landmark_native.nii.gz 

sct_crop_image -i centerline_straight.nii.gz -o centerline_straight_crop.nii.gz -dim 2 -start 29 -end 587

sct_create_cross.py -i centerline_straight_crop.nii.gz -x 55 -y 225

sct_push_into_template_space.py -i centerline_straight_crop.nii.gz -n landmark_native.nii.gz 


#MD


sct_crop_image -i MD_t2.nii.gz -o MD_t2_crop.nii.gz -dim 2 -start 8 -end 534

sct_propseg -i MD_t2_crop.nii.gz -t t2 -centerline-binary -init-centerline MD_t2_crop-mask.nii.gz 

sct_generate_centerline.py -i up.nii.gz -o cup.nii.gz

sct_generate_centerline.py -i down.nii.gz -o cdown.nii.gz

fslmaths MD_t2_crop_centerline.nii.gz -add cup semi.nii.gz

fslmaths semi.nii.gz -add cdown.nii.gz full_centerline.nii.gz

sct_straighten_spinalcord -i MD_t2_crop.nii.gz -c full_centerline.nii.gz 

WarpImageMultiTransform 3 /home/django/jtouati/data/template_data/new_data/Marseille/MD/T2/full_centerline.nii.gz centerline_straight.nii.gz -R /home/django/jtouati/data/template_data/new_data/Marseille/MD/T2/MD_t2_crop_straight.nii.gz /home/django/jtouati/data/template_data/new_data/Marseille/MD/T2/warp_curve2straight.nii.gz 

sct_detect_extrema.py -i centerline_straight.nii.gz 

sct_crop_image -i MD_t2_crop_straight.nii.gz -o MD_t2_crop_straight_crop.nii.gz -dim 2 -start 30 -end 567 
 
sct_create_cross.py -i  MD_t2_crop_straight_crop.nii.gz -x 57 -y 161

sct_push_into_template_space.py -i  MD_t2_crop_straight_crop.nii.gz -n landmark_native.nii.gz 

sct_crop_image -i centerline_straight.nii.gz -o centerline_straight_crop.nii.gz -dim 2 -start 30 -end 567  

sct_create_cross.py -i centerline_straight_crop.nii.gz -x 57 -y 161

sct_push_into_template_space.py -i centerline_straight_crop.nii.gz -n landmark_native.nii.gz 




#MLL 

sct_crop_image -i MLL_t2.nii.gz -o MLL_t2_crop.nii.gz -dim 2 -start 12 -end 542

sct_propseg -i MLL_t2_crop.nii.gz -t t2 -centerline-binary -init-mask MLL_t2_crop-mask.nii.gz 

sct_erase_centerline.py -i MLL_t2_crop_centerline.nii.gz -s 0 -e 115

sct_erase_centerline.py -i centerline_erased.nii.gz -s 453 -e 530

sct_generate_centerline.py -i up.nii.gz -o cup.nii.gz

sct_generate_centerline.py -i down.nii.gz -o cdown.nii.gz

fslmaths centerline_erased.nii.gz -add cup.nii.gz semi.nii.gz

fslmaths semi.nii.gz -add cdown.nii.gz full_centerline.nii.gz

sct_straighten_spinalcord -i MLL_t2_crop.nii.gz -c full_centerline.nii.gz 

WarpImageMultiTransform 3 full_centerline.nii.gz centerline_straight.nii.gz -R MLL_t2_crop_straight.nii.gz warp_curve2straight.nii.gz 
 
sct_detect_extrema.py -i centerline_straight.nii.gz 

sct_crop_image -i MLL_t2_crop_straight.nii.gz -o MLL_t2_crop_straight_crop.nii.gz -dim 2 -start 29 -end 568

sct_create_cross.py -i MLL_t2_crop_straight_crop.nii.gz -x 55 -y 161

sct_push_into_template_space.py -i MLL_t2_crop_straight_crop.nii.gz -n landmark_native.nii.gz 

sct_crop_image -i centerline_straight.nii.gz -o centerline_straight_crop.nii.gz -dim 2 -start 29 -end 568  
 
sct_create_cross.py -i centerline_straight_crop.nii.gz -x 55 -y 161
 
sct_push_into_template_space.py -i centerline_straight_crop.nii.gz -n landmark_native.nii.gz 
 
# TR
mkdir marseille_tr
cd marseille_tr
# convert to nii
dcm2nii -o . /Volumes/data_shared/marseille/TR/01_0016_sc-tse-spc-1mm-3palliers-fov256-nopat-comp-sp-19/original-primary-m-norm-dis2d-comp-sp-composed_e01_*.dcm
# change file name
mv *.nii.gz t2.nii.gz
# orient to RPI
sct_orientation -i t2.nii.gz -s RPI
# open fslview and look at cropping coordinates. Then, crop
sct_crop_image -i t2_RPI.nii.gz -o t2_RPI_crop.nii.gz -dim 1,2 -start 38,0 -end 218,520
# get centerline
sct_propseg -i t2_RPI_crop.nii.gz -t t2 -init-centerline t2_RPI_crop-mask.nii.gz -centerline-binary -max-deformation 5 -verbose -min-contrast 10
# manually adjust centerline and add points in missing parts (e.g., in brainstem)
# N.B. no need to erase because propseg centerline is fine.
# generate centerline from missing parts
sct_generate_centerline.py -i t2_RPI_crop-mask_bottom.nii.gz -o t2_RPI_crop_centerline_bottom.nii.gz
sct_generate_centerline.py -i t2_RPI_crop-mask_top.nii.gz -o t2_RPI_crop_centerline_top.nii.gz
# add centerline
fslmaths t2_RPI_crop_centerline -add t2_RPI_crop_centerline_bottom -add t2_RPI_crop_centerline_top -bin full_centerline
# straighten spinal cord
sct_straighten_spinalcord -i t2_RPI_crop.nii.gz -c full_centerline.nii.gz 
# check if ok:
# fslview t2_RPI_crop_straight.nii.gz &
# apply curve2straight to centerline
sct_apply_transfo -i full_centerline.nii.gz -o centerline_straight.nii.gz -d t2_RPI_crop_straight.nii.gz -w warp_curve2straight.nii.gz -p linear
# detect extrema of straight centerline
sct_detect_extrema.py -i centerline_straight.nii.gz 
# crop image and centerline based on Z-extrema
# NB: for the future, use benjamin's function
sct_crop_image -i t2_RPI_crop_straight.nii.gz -o t2_RPI_crop_straight_crop.nii.gz -dim 2 -start 29 -end 552
sct_crop_image -i centerline_straight.nii.gz -o centerline_straight_crop.nii.gz -dim 2 -start 29 -end 552
# create cross
sct_create_cross.py -i t2_RPI_crop_straight_crop.nii.gz -x 53 -y 125
# push cross into template
# N.B. by default, it uses the template space into /dev/template_creation/template_shape.nii.gz
sct_push_into_template_space.py -i t2_RPI_crop_straight_crop.nii.gz -n landmark_native.nii.gz
# apply warping field to centerline
sct_apply_transfo -i centerline_straight_crop.nii.gz -o centerline_straight_crop_2temp.nii.gz -d ${SCT_DIR}/dev/template_creation/template_shape.nii.gz -w native2temp.txt -p linear
# check result:
# fslview t2_RPI_crop_straight_crop_2temp.nii.gz centerline_straight_crop_2temp &
# create labels manually: 1: PMJ, 2: C3, 3: T1, 4: T7, 5: L1. 
# --> labels.nii.gz
# estimate and apply affine transformation to align vertebrae
sct_align_vertebrae.py -i t2_RPI_crop_straight_crop_2temp.nii.gz -l labels.nii.gz -R ${SCT_DIR}/dev/template_creation/template_shape-mask.nii.gz -o t2_RPI_crop_straight_crop_2temp_aligned.nii.gz -t affine -w spline
# N.B. here, possible improvement in using antsRegistration constrained along z and highly regularized
# apply transfo to centerline
sct_apply_transfo -i centerline_straight_crop_2temp.nii.gz -o centerline_straight_crop_2temp_aligned.nii.gz -d ${SCT_DIR}/dev/template_creation/template_shape-mask.nii.gz -w n2t.txt -p linear
# normalize intensity within spinal cord
sct_normalize.py -i t2_RPI_crop_straight_crop_2temp_aligned.nii.gz -c centerline_straight_crop_2temp_aligned.nii.gz
# now you can use file: t2_RPI_crop_straight_crop_2temp_aligned_normalized.nii.gz into template creation: buildtemplateparallel.sh






