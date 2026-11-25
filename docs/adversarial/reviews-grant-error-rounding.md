### GrantErrorRounding1000.lean

Source: law 331M50000002007, revision 331M50000002007_20230401_505M60000008036, raw snapshot `data/raw/331M50000002007_20230401_505M60000008036.law.json`.
独立再抽出: the clause below was re-extracted programmatically from the pinned
raw snapshot (not copied from the implementation or spec) and compared
character-by-character with the queue unit text.

> 第一項の都道府県又は市町村に譲与すべき額に加算し、又は当該譲与すべき額から減額すべき錯誤に係る額に千円未満の端数金額があるときは、その端数金額を控除した金額をもつて、当該錯誤にかかる額とする。

H/T/D/C/U: H（千円未満端数・切捨て単位を別記録）T（999/1000/1001 の境界と
0・小入力・2500 を kernel-decided examples で検査）D（原文の
「千円未満の端数金額...控除した金額」を独立照合し、加減の別・錯誤認定・
第一項譲与額算定は対象外と明示）C（impl は剰余と減算、spec は
整数除算と乗算で独立定式化）U（加算/減額の別、錯誤認定、譲与額算定、
他条の端数処理は NOT MODELLED。有限 grid の一致は普遍的正しさを意味しない）

判定: 照合 — pinned clause and independently re-extracted text agree verbatim;
the modelled truncation agrees on the kernel-decided grid. Transcription/scope
finding only. 人間による法的レビューは LEGAL_REVIEW_PENDING であり、
本記録は承認や法的正しさの証明ではない。
