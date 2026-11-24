### SpouseIncomeCeiling950k.lean

Source: law 340AC0000000033, revision 340AC0000000033_20261001_507AC0000000070, raw snapshot `data/raw/340AC0000000033_20261001_507AC0000000070.law.json`.
独立再抽出: the clause below was re-extracted programmatically from the pinned
raw snapshot (not copied from the implementation or spec) and compared
character-by-character with the queue unit text.

> 合計所得金額が九十五万円以下である配偶者

H/T/D/C/U: H（九十五万円の閾値を円単位で別途記録）T（950000 を境に
kernel-decided examples で真偽を検査）D（原文の「九十五万円以下」を独立照合し、
配偶者控除額・他の要件は対象外と明示）C（impl は <=、spec は not (<) で
独立定式化）U（居住者・生計一・年末調整・他号他条は NOT MODELLED）

判定: 照合 — pinned clause and independently re-extracted text agree verbatim;
the modelled threshold agrees on the kernel-decided grid. Transcription/scope
finding only. 人間による法的レビューは LEGAL_REVIEW_PENDING であり、
本記録は承認や法的正しさの証明ではない。
