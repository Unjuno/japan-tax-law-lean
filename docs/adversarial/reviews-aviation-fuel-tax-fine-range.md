### AviationFuelTaxFineRange.lean

Source: law 431AC0000000003, revision 431AC0000000003_20260401_508AC0000000002, raw snapshot `data/raw/431AC0000000003_20260401_508AC0000000002.law.json`.
独立再抽出: the clause below was re-extracted programmatically from the pinned
raw snapshot (not copied from the implementation or spec) and compared
character-by-character with the queue unit text.

> 前項の納入しなかった金額が二百万円を超える場合には、情状により、同項の罰金の額は、同項の規定にかかわらず、二百万円を超える額でその納入しなかった金額に相当する額以下の額とすることができる。

H/T/D/C/U: H（二百万円の下限と未納入額の上限を別記録）T（1999999/
2000000/2000001 の境界を kernel-decided examples で検査）D（原文の
「二百万円を超える額...相当する額以下」を独立照合し、情状認定・犯罪成立・
納入額算定は対象外と明示）C（impl は厳密比較と論理積、spec は
逆向きの非厳密ガードで独立定式化）U（情状認定、前項犯罪の成立、
納入額算定、併科・手続は NOT MODELLED。有限 grid の一致は普遍的正しさを
意味しない）

判定: 照合 — pinned clause and independently re-extracted text agree verbatim;
the modelled interval agrees on the kernel-decided grid. Transcription/scope
finding only. 人間による法的レビューは LEGAL_REVIEW_PENDING であり、
本記録は承認や法的正しさの証明ではない。
