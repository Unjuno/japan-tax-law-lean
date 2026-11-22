### AntennaPowerCeiling.lean — 登録免許税法施行令 第十二条（空中線電力五百ワット以下）

一次資料 独立再抽出 / 照合（BY-DESIGN / CONFIRMED）。

- Law id: 342CO0000000146 ; Revision: 342CO0000000146_20261001_507CO0000000124
- Source: data/raw/342CO0000000146_20261001_507CO0000000124.law.json
- SHA-256: 0fc3f9ca8c85fa0dbafec4de836a9c1cbf7153c01e58f01b25995aa29ec9aa2b
- Article Num: 12（第十二条; raw JSON Article attr.Num = "12"）
- 原文 needle（verbatim, scoped Article 12）: 「法別表第一第五十四号（二）に規定する政令で定める登録は、基本送信機の規模が空中線電力五百ワット以下の無線局の登録とする。」
- 数値リテラル: 500（五百ワット）, inclusive `<=`（以下）。単位はワット (W) の物理単位であり、金額・個数閾値ではない。
- 境界カテゴリ: zero(0) / small_input(1) / threshold_below(499) / threshold_at(500) / threshold_above(501) = 5（>=3）。

判定: 独立再抽出した一次資料の scoped Article 12 に needle が逐字存在し、SHA-256 が一致。五百 = 500（inclusive <=）を確認。BY-DESIGN: 空中線電力五百ワット以下の数値閾値のみを表現し、法別表第一第五十四号（二）, 第十二条の他の記述, 登録手続は対象外。CONFIRMED: spec は独立定義 specCeiling / specWithin を用い、impl 識別子を再利用しない（agreeCeiling / agreeWithin は unfold; rfl のブリッジのみ）。

H/T/D/C/U:
- H（原文）: needle は Article 12 の scoped 原文に逐字存在（照合済）。
- T（閾値）: 「空中線電力五百ワット以下」— 五百 = 500 W inclusive (<=)。
- D（境界）: 0 true / 1 true / 499 true / 500 true / 501 false / 1000 false を kernel-decide。
- C（整合）: agreeCeiling / agreeWithin が unfold; rfl で impl = spec を確認。
- U（用途）: 空中線電力の数値閾値のみ; 登録手続・他の条文は対象外（BY-DESIGN）。

Note: 本レビューは機械的検証（kernel-decide + 独立再抽出 + SHA-256 照合）の記録であり、人間の法的判断ではない（mechanical, not human）。
