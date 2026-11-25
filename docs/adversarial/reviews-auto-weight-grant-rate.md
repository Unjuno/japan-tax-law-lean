### AutoWeightGrantRate357.lean

Source: law 346AC0000000090, revision 346AC0000000090_20260401_508AC0000000002, raw snapshot `data/raw/346AC0000000090_20260401_508AC0000000002.law.json`.
独立再抽出: the clause below was re-extracted programmatically from the pinned
raw snapshot (not copied from the implementation or spec) and compared
character-by-character with the queue unit text.

> 自動車重量譲与税は、自動車重量税法（昭和四十六年法律第八十九号）の規定による自動車重量税の収入額の千分の三百五十七に相当する額とし、市町村（特別区を含む。以下同じ。）及び都道府県に対して譲与するものとする。

H/T/D/C/U: H（千分率 357 と分母 1000 を別記録）T（356/357/358 と
999/1000/1001、零・小入力を kernel-decided examples で検査）D（原文の
「収入額の千分の三百五十七」を独立照合し、収入額算定・配分・端数処理は
対象外と明示）C（impl は単一の乗算と除算、spec は千単位分解と剰余で
独立定式化）U（収入額の算定、市町村/都道府県の配分、端数処理、
帰属年度は NOT MODELLED。有限 grid の一致は普遍的正しさを意味しない）

判定: 照合 — pinned clause and independently re-extracted text agree verbatim;
the modelled rate agrees on the kernel-decided grid. Transcription/scope
finding only. 人間による法的レビューは LEGAL_REVIEW_PENDING であり、
本記録は承認や法的正しさの証明ではない。
