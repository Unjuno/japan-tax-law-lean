### GeneralTariffLowerRate.lean

Source: law 414CO0000000262, revision 414CO0000000262_20110401_423CO0000000088, raw snapshot `data/raw/414CO0000000262_20110401_423CO0000000088.law.json`.
独立再抽出: the clause below was re-extracted programmatically from the pinned
raw snapshot (not copied from the implementation or spec) and compared
character-by-character with the queue unit text.

> 特定貨物に課する不当廉売関税及び一般税率（法の別表の税率及び条約に規定する税率のうちいずれか低いものをいう。）による関悦については、それぞれ別個の関税として関税法（昭和二十九年法律第六十一号）第二章の規定を適用する。

H/T/D/C/U: H（別表税率・条約税率・低い方の一般税率を別記録）T（同値・
大小・零・小入力を kernel-decided examples で検査）D（原文の
「税率及び条約に規定する税率のうちいずれか低いもの」を独立照合し、
税率の検索・货物認定は対象外と明示）C（impl は条約側の厳密比較、
spec は別表側の非厳密ガードで独立定式化）U（特定貨物の認定、別表・条約の
税率検索、不当廉売認定、関税法適用手続は NOT MODELLED。有限 grid の
一致は普遍的正しさを意味しない）

判定: 照合 — pinned clause and independently re-extracted text agree verbatim;
the modelled lower-rate selection agrees on the kernel-decided grid.
Transcription/scope finding only. 人間による法的レビューは
LEGAL_REVIEW_PENDING であり、本記録は承認や法的正しさの証明ではない。
