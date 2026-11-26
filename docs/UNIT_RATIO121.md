# Normative units — 法人税法施行令 第百二十一条の二（デリバティブ取引等の割合計算）（8 units, PROVED_SCOPE）

Genuine per-provision formalization. Pinned original: 法人税法施行令 Article 121_2.

## 原文の規範構造
8 units all compute 「法第六十一条の六第一項に規定する利益額（又は損失額）を
その超える部分の金額で除して計算した割合」= gain/loss amount ÷ exceeding portion.

| id | content |
|---|---|
| H | 割合は分子÷分母; 分子0なら割合0; 分母1なら割合=分子; 分母正なら分子について単調; 分子と分母に同じ正係数を掛けても割合不変; 利益割合と損失割合は同じ計算構造。 |
| T | `lake build JapanTaxLaw.CorpDerivativeRatio121_2Tests`; `python scripts/ci/source_audit_ratio121.py` |
| D | カーネル証明: ratio_zero_numerator / ratio_denominator_one / ratio_monotone_numerator / ratio_scale_invariant / gain_loss_same_structure。8片 verbatim (3/3)。 |
| C | 対立解釈: 分子0で非ゼロ割合、分母1で割合≠分子、分母正で分子増なのに割合減、を却下。 |
| U | 具体の金額・取引・「超える部分」の計算は NOT MODELLED; 法61-6(1)参照は未モデル化; 人間レビュー保留(別軸) → PROVED_SCOPE。 |
