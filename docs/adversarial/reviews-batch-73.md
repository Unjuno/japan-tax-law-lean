### OwnershipPercent5.lean — 租税特別措置法施行令 第一条の八（社外株式五パーセント所有）

一次資料 独立再抽出 / 照合（BY-DESIGN / CONFIRMED）。

- Law id: 329CO0000000155 ; Revision: 329CO0000000155_20260401_508CO0000000085
- Source: data/raw/329CO0000000155_20260401_508CO0000000085.law.json
- SHA-256: 7f76960b6510a6bd086c236c7d7facf5e47cb276f24a3f4a705c0c0aa8e15d01
- Article Num: 1_8（第一条の八; raw JSON Article attr.Num = "1_8"）
- 原文 needle（verbatim, scoped Article 1の8）: 「いずれか一方の者が他方の者の事業に係る議決権を伴う社外株式の総数の五パーセント以上の社外株式を直接又は間接に所有し、管理し、又は所持している場合」
- 数値リテラル: 5（五パーセント）, inclusive `>=`（以上）。社外株式の所有割合（パーセント）の数値閾値であり、金額・個数閾値ではない。
- 境界カテゴリ: zero(0) / small_input(1) / threshold_below(4) / threshold_at(5) / threshold_above(6) = 5（>=3）。

判定: 独立再抽出した一次資料の scoped Article 1_8 に needle が逐字存在し、SHA-256 が一致。五パーセント = 5（inclusive >=）を確認。BY-DESIGN: 所有割合の数値閾値のみを表現し、議決権・社外株式・直接又は間接・所有管理所持, 第一条の八の他の記述は対象外。CONFIRMED: spec は独立定義 specThreshold / specMeets を用い、impl 識別子を再利用しない（agreeThreshold / agreeMeets は unfold; rfl のブリッジのみ）。

H/T/D/C/U:
- H（原文）: needle は Article 1_8 の scoped 原文に逐字存在（照合済）。
- T（閾値）: 「五パーセント以上」— 五 = 5 % inclusive (>=)。
- D（境界）: 0 false / 1 false / 4 false / 5 true / 6 true / 100 true を kernel-decide。
- C（整合）: agreeThreshold / agreeMeets が unfold; rfl で impl = spec を確認。
- U（用途）: 社外株式所有割合の数値閾値のみ; 他の条文・定性表現は対象外（BY-DESIGN）。

Note: 本レビューは機械的検証（kernel-decide + 独立再抽出 + SHA-256 照合）の記録であり、人間の法的判断ではない（mechanical, not human）。
