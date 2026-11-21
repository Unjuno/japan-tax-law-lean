# Adversarial review — batch 38

### ConsumptionTaxRateThreePercent.lean — 税制改革法 第十条

- 独立再抽出: doc-comment / transcription_audit.py / impl・spec・tests を一切信用せず、worktree 外 `D:\CodexData\Temp` の使い捨て Python が pinned 生 JSON を直接読み、自前 walker で `tag=Article` & `attr.Num="10"` を定位・正規化（`\s+` 除去）。実行後に一時スクリプトは削除済み。
- 一次資料: `data/raw/363AC0000000107_19881230_000000000000000.law.json`（law 363AC0000000107, revision 363AC0000000107_19881230_000000000000000）。
- SHA-256 再計算: `65abd2145fc6c71615ba5752d906f16e4efd54b47381675bff9e50f274c6a9df`（生バイト 25412 バイト; CRLF 正規化後も同一）→ CONFIRMED。
- Article 定位: `Num="10"` を構造走査で 1 件検出、正規化スコープ本文 474 文字を取得 → CONFIRMED。
- 逐語照合: needle「消費税は、事業者による商品の販売、役務の提供等の各段階において課税し、経済に対する中立性を確保するため、課税の累積を排除する方式によるものとし、その税率は、百分の三とする。」は正規化 86 文字、正規化スコープ本文に verbatim 1 回存在（判定: FOUND）→ CONFIRMED。
- 数詞再計算: 百分の三 = 3/100。impl の rateNumerator=3 / rateDenominator=100、spec の specNum=3 / specDen=100 と一致 → CONFIRMED。
- 境界照合 (≥3): base 0 / tax 0 → true; base 100 / tax 3 → true; base 1000 / tax 30 → true; base 100 / tax 4 → false; base 1 / tax 0 → false（端数切り捨てなし、exact 関係）; base 200 / tax 6 → true。矛盾 0 → CONFIRMED。
- 検出器: `independent_spec_ok` True（独立定数 specNum・specDen と演算子反転 `base*specNum == tax*specDen`、impl 識別子なし。普遍定理 agreeTaxEquals が omega でカーネル橋渡し）、`boundary_evidence_categories` = {zero, small_input, saturation}、`spec_literals` = {3, 100}、`source_literals_verified(spec_literals, scoped)` True（百分の三 = 3/100 を認識）。

判定: BY-DESIGN / CONFIRMED（原文の明示的な数値税率 百分の三 = 3/100 のみをモデル化。1988 年の税制改革法の歴史的税率であり現行消費税率とは別。累積排除方式・中立性・現行税率は範囲外）。全 H で通過。

H/T/D/C/U（独立レビュー記録）:
- H（原条項）: 第十条の「その税率は、百分の三とする。」という明示的な数値税率のみ。
- T（逐語性）: 自前再抽出の 86 文字 needle が正規化スコープ本文に verbatim 1 回存在。SHA-256 は生バイトから再計算。
- D（導出）: 百分の三 → 3/100。exact 交叉乗算 tax*100 == base*3（除算・丸めなし）。独立 spec は定数・被演算子を独自に持ち、普遍 omega 定理のみでカーネル橋渡し。
- C（整合）: zero / 100→3 / 1000→30 / 100→4 / 1→0 / impl↔spec 一致を全て `by decide` または普遍定理で確認。
- U（範囲外）: 累積排除方式・中立性・仕組み・廃止税目・現行消費税率（消費税法 art. 29）・実数・負の値（Nat 前提）は NOT MODELLED。

注記: 本記録は機械的検証（worktree 外での再抽出・再計算・検出器実行）の結果であり、人間の法解釈レビューではない（LEGAL_REVIEW_PENDING; mechanical, not human review）。
