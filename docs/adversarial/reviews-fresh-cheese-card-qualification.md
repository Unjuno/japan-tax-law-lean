### FreshCheeseCardQualification.lean

Source: law 335CO0000000069, revision 335CO0000000069_20260401_508CO0000000085, raw snapshot `data/raw/335CO0000000069_20260401_508CO0000000085.law.json`.
独立再抽出: the clause below was re-extracted programmatically from the pinned
raw snapshot (not copied from the implementation or spec) and compared
character-by-character with the queue unit text.

> 関税率表第〇四〇六・一〇号に掲げるフレッシュチーズ及びカード（いずれも乾燥固形分が全重量の四十八パーセント以下のもの（一個の重量が四グラム以下の細片にし、冷凍し、かつ、正味重量が五キログラムを超える直接包装にしたものに限る。）、関税割当チーズ及びクリームチーズ（軟質で展延性のある熟成していないリンドレスチーズであつて、乾燥固形分のうちに占める乳脂肪分の割合、無脂肪ベースでの全重量のうちに占める水分の割合及び全重量のうちに占める乾燥固形分の割合が、それぞれコーデックスのクリームチーズの規格（ＣＯＤＥＸ

H/T/D/C/U: H（乾燥固形分48%・細片4g・正味5kg超を別々に記録）T（47/48/49、
3/4/5、5/6 の境界を kernel-decided examples で検査）D（原文の三つの数値条件を
独立照合し、CODEX 規格後半・物品分類は対象外と明示）C（impl は前向き連言、
spec は逆向きガードで独立定式化）U（CODEX 規格、関税割当チーズ・
クリームチーズの詳細認定、物品分類、端数処理は NOT MODELLED。有限 grid の
一致は普遍的正しさを意味しない）

判定: 照合 — pinned clause and independently re-extracted text agree verbatim;
the modelled conditions agree on the kernel-decided grid. Transcription/scope
finding only. 人間による法的レビューは LEGAL_REVIEW_PENDING であり、
本記録は承認や法的正しさの証明ではない。
