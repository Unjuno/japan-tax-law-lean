### OverseasMarketPriceCeiling.lean

Source: law 344M50000040016, revision 344M50000040016_20260401_508M60000040016, raw snapshot `data/raw/344M50000040016_20260401_508M60000040016.law.json`.
独立再抽出: the clause below was re-extracted programmatically from the pinned
raw snapshot (not copied from the implementation or spec) and compared
character-by-character with the queue unit text.

> 一個（現に使用中のもので海外市価（外国においてその物品を購入する際に支払われた又は支払われるべき価格をいう。以下この条において同じ。）三万円以下のものに限る。次号において同じ。）

H/T/D/C/U: H（海外市価・三万円の上限・使用中要件を別記録）T（29999/
30000/30001 と零・小入力を kernel-decided examples で検査）D（原文の
「海外市価...三万円以下」を独立照合し、価格算定・物品認定は対象外と明示）
C（impl は非厳密比較、spec は厳密比較の否定で独立定式化）U（現に使用中
要件、物品の特定、海外市価の算定、次号の適用は NOT MODELLED。有限 grid の
一致は普遍的正しさを意味しない）

判定: 照合 — pinned clause and independently re-extracted text agree verbatim;
the modelled ceiling agrees on the kernel-decided grid. Transcription/scope
finding only. 人間による法的レビューは LEGAL_REVIEW_PENDING であり、
本記録は承認や法的正しさの証明ではない。
