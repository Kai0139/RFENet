#!/usr/bin/env bash
OUTPUT_DIR=/home/zhangkai/data/glass_seg/trans10k/results/rfenet/
CKPT_PATH=/home/zhangkai/repos/glass_seg/RFENet/weights/best_trans10k.pth
DATA_DIR=/home/zhangkai/data/glass_seg/trans10k/

echo "Running inference on" ${DATA_DIR}
echo "Saving Results :" ${OUTPUT_DIR}
python3 eval.py \
	--dataset Trans10k \
    --dataset_dir ${DATA_DIR} \
    --arch network.RFENet.RFENet_resnet50_os8 \
    --inference_mode  whole \
    --single_scale \
    --scales 1.0 \
    --split test \
    --cv_split 0 \
    --resize_scale 512 \
    --mode semantic \
    --with_mae_ber \
    --no_flip \
    --ckpt_path ${CKPT_PATH} \
    --snapshot ${CKPT_PATH} \
    --num_cascade 4 \
    --edge_num_points 256 \
    --region_num_points 256 \
    --dump_images \
    --output_dir ${OUTPUT_DIR}
