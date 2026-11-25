### PowerDevelopmentTaxFineRange.lean

Source: law 349AC0000000079, revision 349AC0000000079_20250601_504AC0000000068, raw snapshot `data/raw/349AC0000000079_20250601_504AC0000000068.law.json`.
独立再抽出: the clause below was re-extracted programmatically from the pinned
raw snapshot (not copied from the implementation or spec) and compared
character-by-character with the queue unit text.

> 前項の犯罪に係る販売電気に対する電源開発促進税に相当する金額が五十万円を超える場合には、情状により、同項の罰金は、五十万円を超え当該電源開発促進税に相当する金額以下とすることができる。

H/T/D/C/U: H（五十万円の下限と税額の上限を別記録）T（499999/500000/500001 の
境界を kernel-decided examples で検査）D（原文の「五十万円を超え...額以下」を
独立照合し、情状認定・犯罪成立・税額算定は対象外と明示）C（impl は
厳密比較と論理積、spec は逆向きの非厳密ガードで独立定式化）
U（情状認定、前項犯罪の成立、税額算定、併科・手続は NOT MODELLED。
有限 grid の一致は普遍的正しさを意味しない）

判定: 照合 — pinned clause and independently re-extracted text agree verbatim;
the modelled interval agrees on the kernel-decided grid. Transcription/scope
finding only. 人間による法的レビューは LEGAL_REVIEW_PENDING であり、
本記録は承認や法的正しさの証明ではない。
