### PatentTransferRatio.lean

Source: law 332M50000040015, revision 332M50000040015_20261101_507M60000040026, raw snapshot `data/raw/332M50000040015_20261101_507M60000040026.law.json`.
独立再抽出: the clause below was re-extracted programmatically from the pinned
raw snapshot (not copied from the implementation or spec) and compared
character-by-character with the queue unit text.

> 当該金額に取引数（当該特許権譲渡等取引及び当該特定特許権等に係る他の特許権譲渡等取引の数をいう。以下この号において同じ。）から一を控除した数が取引数のうちに占める割合を乗じて計算した金額

H/T/D/C/U: H（金額・取引数・(取引数-1)/取引数を別記録）T（0/1/2/3/4 の
取引数と零・小入力を kernel-decided examples で検査）D（原文の
「取引数から一を控除した数が取引数のうちに占める割合」を独立照合し、
取引認定・金額算定は対象外と明示）C（impl は単一の乗算除算、spec は
商と剰余の分解で独立定式化）U（特許権譲渡等取引の認定、特定特許権等の判定、
当該金額算定、端数詳細は NOT MODELLED。有限 grid の一致は普遍的正しさを
意味しない）

判定: 照合 — pinned clause and independently re-extracted text agree verbatim;
the modelled ratio agrees on the kernel-decided grid. Transcription/scope
finding only. 人間による法的レビューは LEGAL_REVIEW_PENDING であり、
本記録は承認や法的正しさの証明ではない。
