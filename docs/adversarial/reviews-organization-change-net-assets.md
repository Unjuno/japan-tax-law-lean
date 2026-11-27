### OrganizationChangeNetAssets.lean

Source: law 342M50000040037, revision 342M50000040037_20260401_508M60000040008, raw snapshot `data/raw/342M50000040037_20260401_508M60000040008.law.json`.
独立再抽出: the clause below was re-extracted programmatically from the pinned
raw snapshot (not copied from the implementation or spec) and compared
character-by-character with the queue unit text.

> 組織変更をする会社の当該組織変更の直前における資産の額から負債の額を控除した額（当該控除した額がイに掲げる額以下である場合にあつては、イに掲げる額）

H/T/D/C/U: H（資産・負債・差額・イの額を別記録）T（0・小入力・下限到達・
負債超過を kernel-decided examples で検査）D（原文の「資産から負債を控除した額」
と「イに掲げる額」を独立照合し、イの算定・評価は対象外と明示）
C（impl は二段の条件比較、spec はガード付き減算と max で独立定式化）
U（イの額の算定、資産負債の評価、組織変更の認定・手続は NOT MODELLED。
有限 grid の一致は普遍的正しさを意味しない）

判定: 照合 — pinned clause and independently re-extracted text agree verbatim;
the modelled floor agrees on the kernel-decided grid. Transcription/scope
finding only. 人間による法的レビューは LEGAL_REVIEW_PENDING であり、
本記録は承認や法的正しさの証明ではない。
