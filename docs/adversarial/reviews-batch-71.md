### AdultAgeThreshold.lean — 成年者年齢二十歳以上 第七条（沖縄の復帰に伴う地方税法等の適用の特別措置等に関する省令）

一次資料 独立再抽出 / 照合（BY-DESIGN / CONFIRMED）。

- Law id: 347M50000008013 ; Revision: 347M50000008013_20010106_412M50000008044
- Source: data/raw/347M50000008013_20010106_412M50000008044.law.json
- SHA-256: de204ca8423008be669b39af7fbda3da864471b0f0d0eb37f039159ae993cb51
- Article Num: 7
- 原文 needle（verbatim）: 「前二項の成年者数は、官報で公示された最近の国勢調査の結果による年齢二十歳以上の人口をいう。」
- 数値リテラル: 20（二十歳）, inclusive `>=`（以上）。境界カテゴリ: zero / small_input(10) / threshold_below(19) / threshold_at(20) / threshold_above(21) = 5。

判定: 独立再抽出した一次資料の当該条文に needle が逐字存在し、二十 = 20 (inclusive >=) を確認。BY-DESIGN: 成年者 = 年齢二十歳以上 の数値閾値のみを表現し、国勢調査の人口算定は対象外。CONFIRMED: spec は独立定義 specAge / specAdult を用い、impl 識別子を再利用しない（agreeAge / agreeAdult は unfold; rfl のブリッジのみ）。

Title correction（BY-DESIGN / CONFIRMED）: キュー・ラベルの "CabinetOrder" は切り詰め表示。一次データの law_type は MinisterialOrdinance、正式題名は「沖縄の復帰に伴う地方税法等の適用の特別措置等に関する省令」（省令）と確認・訂正した。政令 (CabinetOrder) ではない。

H/T/D/C/U:
- H（原文）: needle は Article 7 の scoped 原文に逐字存在（照合済）。
- T（閾値）: 「年齢二十歳以上の人口」— 二十 = 20 inclusive (>=)。
- D（境界）: 0 false / 10 small-input / 19 false / 20 true / 21 true を kernel-decide。
- C（整合）: agreeAge / agreeAdult が unfold; rfl で impl = spec を確認。
- U（用途）: 成年者数の年齢閾値のみ; 人口算定・公示手続は対象外（BY-DESIGN）。

Note: 本レビューは機械的検証（kernel-decide + 独立再抽出 + SHA-256 照合）の記録であり、人間の法的判断ではない（mechanical, not human）。
