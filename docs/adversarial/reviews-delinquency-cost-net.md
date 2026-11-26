### DelinquencyCostNet.lean

Source: law 329CO0000000051, revision 329CO0000000051_20260401_508CO0000000085, raw snapshot `data/raw/329CO0000000051_20260401_508CO0000000085.law.json`.
独立再抽出: the clause below was re-extracted programmatically from the pinned
raw snapshot (not copied from the implementation or spec) and compared
character-by-character with the queue unit text.

> 滞納処分費の収納済額及び滞納処分費に係る返納金（過誤納金の還付金等に係るものに限る。）の収納済額の合計額から滞納処分費に係る支払決定済額を控除した金額は、一般会計の雑収入とする。

H/T/D/C/U: H（収納済額・返納金収納済額・支払決定済額・雑収入を別記録）T（零・
小入力・同値・超過を kernel-decided examples で検査）D（原文の「収納済額の
合計額から支払決定済額を控除した金額」を独立照合し、還付金認定は対象外と
明示）C（impl は合計後比較、spec は非正ガード付き減算で独立定式化）
U（過誤納金還付金等の認定、一般会計の整理・帳簿処理は NOT MODELLED。
有限 grid の一致は普遍的正しさを意味しない）

判定: 照合 — pinned clause and independently re-extracted text agree verbatim;
the modelled subtraction agrees on the kernel-decided grid. Transcription/scope
finding only. 人間による法的レビューは LEGAL_REVIEW_PENDING であり、
本記録は承認や法的正しさの証明ではない。
