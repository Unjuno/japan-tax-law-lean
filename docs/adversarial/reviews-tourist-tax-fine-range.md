### TouristTaxFineRange.lean

Source: law 430AC0000000016, revision 430AC0000000016_20260701_508AC0000000012, raw snapshot `data/raw/430AC0000000016_20260701_508AC0000000012.law.json`.
独立再抽出: the clause below was re-extracted programmatically from the pinned
raw snapshot (not copied from the implementation or spec) and compared
character-by-character with the queue unit text.

> 前項の納付しなかった国際観光旅客税の額が二百万円を超えるときは、情状により、同項の罰金は、二百万円を超えその納付しなかった国際観光旅客税の額に相当する金額以下とすることができる。

H/T/D/C/U: H（二百万円の下限と未納税額の上限を別々に記録）T（1999999/
2000000/2000001 の境界を kernel-decided examples で検査）D（原文の
「二百万円を超え...額以下」を独立照合し、情状認定・犯罪成立は対象外と明示）
C（impl は厳密比較と論理積、spec は逆向きの非厳密ガードで独立定式化）
U（情状認定、前項犯罪の成立、未納税額の算定、併科・手続は NOT MODELLED。
有限 grid の一致は普遍的正しさを意味しない）

判定: 照合 — pinned clause and independently re-extracted text agree verbatim;
the modelled interval agrees on the kernel-decided grid. Transcription/scope
finding only. 人間による法的レビューは LEGAL_REVIEW_PENDING であり、
本記録は承認や法的正しさの証明ではない。
