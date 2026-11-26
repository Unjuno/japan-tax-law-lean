### GasolineTransferPayable.lean

Source: law 332AC0000000055, revision 332AC0000000055_20260525_506AC0000000052, raw snapshot `data/raw/332AC0000000055_20260525_506AC0000000052.law.json`.
独立再抽出: the clause below was re-extracted programmatically from the pinned
raw snapshot (not copied from the implementation or spec) and compared
character-by-character with the queue unit text.

> 第六号に掲げる揮発油税額から前号に掲げる揮発油税額を控除した金額に相当する揮発油税額（以下「移出に係る納付すべき税額」という。）

H/T/D/C/U: H（第六号税額・前号税額・控除後税額を別記録）T（0・小入力・
同値・超過の境界を kernel-decided examples で検査）D（原文の
「第六号...から前号...を控除した金額」を独立照合し、各号税額の算定は
対象外と明示）C（impl は条件比較、spec は非正ガード付き減算で独立定式化）
U（各号税額の算定、移出の認定、申告・納付手続は NOT MODELLED。有限 grid の
一致は普遍的正しさを意味しない）

判定: 照合 — pinned clause and independently re-extracted text agree verbatim;
the modelled subtraction agrees on the kernel-decided grid. Transcription/scope
finding only. 人間による法的レビューは LEGAL_REVIEW_PENDING であり、
本記録は承認や法的正しさの証明ではない。
