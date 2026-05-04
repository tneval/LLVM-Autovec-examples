
This example produces interesting vectorization.

mem2reg needed?
loop-rotate needed?


debugir red-two-loops.ll

opt red-two-loops.dbg.ll -mcpu=native -passes=loop-vectorize -pass-remarks=loop-vectorize -pass-remarks-missed=loop-vectorize -pass-remarks-analysis=loop-vectorize -pass-remarks-output=outt_dir2.yaml -S -o out_dir2.ll

opt-viewer.py outt_dir2.yaml