### TreasuryCollectionNet.lean

Source: law 329AC0000000036, revision 329AC0000000036_20240101_431AC0000000003, raw snapshot `data/raw/329AC0000000036_20240101_431AC0000000003.law.json`.
独立再抽出: the clause below was re-extracted programmatically from the pinned
raw snapshot (not copied from the implementation or spec) and compared
character-by-character with the queue unit text.

> 財務大臣は、毎会計年度、政令で定めるところにより、当該年度の初日から翌年度の五月三十一日までの期間内において資金に受け入れた国税収納金等（国税に係る返納金で政令で定めるもの並びに特定地方税及びこれに係る返納金を除く。）で当該年度に所属するものの額から当該年度において支払の決定をした過誤納金の還付金等（特定地方税に係る過誤納金の還付金等を除く。第三項において同じ。）の額を控除した額を、当該年度の一般会計又は特別会計の歳入に組み入れるものとする。

H/T/D/C/U: H（受入額・還付額・対象期間を別々に記録）T（0・小入力・
上限 0 の saturation を kernel-decided examples で検査）D（原文の
「還付金等の額を控除した額」を独立照合し、政令の区分・特定地方税の除外・
日付計算は対象外と明示）C（impl は min と条件付き減算、spec は
非正ガード付き減算で独立定式化）U（会計年度・五月三十一日までの期間計算、
返納金区分、特定地方税、会計区分は NOT MODELLED。有限 grid の一致は
普遍的正しさを意味しない）

判定: 照合 — pinned clause and independently re-extracted text agree verbatim;
the modelled subtraction agrees on the kernel-decided grid. Transcription/scope
finding only. 人間による法的レビューは LEGAL_REVIEW_PENDING であり、
本記録は承認や法的正しさの証明ではない。
