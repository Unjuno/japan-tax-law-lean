### TouristTaxPenaltyBounds.lean

Source: law 430AC0000000016, revision 430AC0000000016_20260701_508AC0000000012, raw snapshot `data/raw/430AC0000000016_20260701_508AC0000000012.law.json`.
独立再抽出: the clause below was re-extracted programmatically from the pinned
raw snapshot (not copied from the implementation or spec) and compared
character-by-character with the queue unit text.

> 次の各号のいずれかに該当する者は、一年以下の拘禁刑又は五十万円以下の罰金に処する。

H/T/D/C/U: H（一年以下の拘禁・五十万円以下の罰金を別々に記録）T（499999/
500000/500001 と 1/2 年の境界を kernel-decided examples で検査）D（原文の
二つの上限を独立照合し、各号の行為認定・量刑選択は対象外と明示）
C（impl は論理和、spec はガード付き分岐で独立定式化）U（各号行為の認定、
量刑選択・併科、手続は NOT MODELLED。有限 grid の一致は普遍的正しさを
意味しない）

判定: 照合 — pinned clause and independently re-extracted text agree verbatim;
the modelled bounds agree on the kernel-decided grid. Transcription/scope
finding only. 人間による法的レビューは LEGAL_REVIEW_PENDING であり、
本記録は承認や法的正しさの証明ではない。
