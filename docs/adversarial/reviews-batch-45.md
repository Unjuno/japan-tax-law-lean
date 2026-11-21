# Adversarial review — batch 45

### CorporateSpecialTaxRate2_5.lean — 法人特別税法 第十条

- 独立再抽出: doc-comment / impl・spec・tests を一切信用せず、worktree 外 `D:\CodexData\Temp` の使い捨て Python が pinned 生 JSON を直接読み、自前 walker で `tag=Article` & `attr.Num="10"` を定位・正規化（空白除去）。実行後に一時スクリプトは削除済み。
- 一次資料: `data/raw/404AC0000000015_20010401_413AC0000000006.law.json`（law 404AC0000000015, revision 404AC0000000015_20010401_413AC0000000006, 法人特別税法, Act, 平成四年法律第十五号; enforcement 2001-04-01）。
- SHA-256 再計算: `603e33a8712eb9db5652935ae8d8fd793bcee4a2b5ed6fe513d2686435ffa5b8`（生バイト 74185 バイト）→ CONFIRMED。
- Article 定位: `Num="10"` を構造走査で 1 件検出、Caption「（税率）」/ 正文 166 文字（正規化）を取得 → CONFIRMED。
- 逐語照合: needle「法人特別税の額は、各課税事業年度の課税標準法人税額に百分の二・五の税率を乗じて計算した金額とする。」（49 文字）は当該 Article ノード内に verbatim 1 回、原文全体でも 1 回（判定: FOUND）→ CONFIRMED。
- 数詞再計算（two-anchor rate）: 百分の二・五 = 2.5/100 = 25/1000 = 1/40。impl の rateNumerator=25 / rateDenominator=1000、spec の specNum=25 / specDen=1000 と一致。原文に「百分の」「二・五」の二つの anchor が verbatim 存在し、25/1000 はこの二つの anchor から導出（単一リテラルではない）→ CONFIRMED。
- 境界照合 (≥3): base 0 / tax 0 → true; base 1000 / tax 25 → true; base 4000 / tax 100 → true; base 1000 / tax 26 → false; base 100 / tax 2 → false（100×25=2500≠2000、端数切り捨てなし）; base 40 / tax 1 → true, base 40 / tax 2 → false。矛盾 0 → CONFIRMED。
- 検出器: `independent_spec_ok` True（spec は独自定数 specNum=25・specDen=1000 と被演算子反転 `specDen*tax == specNum*base` のみで impl 識別子なし）、`boundary_evidence_categories` = {zero, small_input, saturation}、`spec_literals` = {25, 1000}、`source_literals_verified` True（two-anchor rate: 「百分の」+「二・五」→ 25/1000 を原文より直接照合）→ CONFIRMED。
- 橋渡し: 普遍定理 agreeTaxEquals は unfold 後の純粋 `rw [Nat.mul_comm 1000 tax, Nat.mul_comm 25 base]`（rfl に帰着）。by_cases / omega / Classical.choice / propext を用いない axiom-free のカーネル橋渡し → CONFIRMED。

判定: BY-DESIGN / CONFIRMED（原文の明示的な数値税率 百分の二・五 = 25/1000 のみをモデル化。2001 年施行の法人特別税法の歴史的税率。課税標準法人税額の算定・各課税事業年度・累積・他の条項は範囲外）。全 H で通過。

H/T/D/C/U（独立レビュー記録）:
- H（原条項）: 第十条（Caption「税率」）の「税率を乗じて計算した金額とする。」という明示的数値税率のみ。
- T（逐語性）: 自前再抽出の 49 文字 needle が当該 Article 内に verbatim 1 回。SHA-256 は生バイトから再計算。
- D（導出）: 百分の二・五 → 2.5/100 → 25/1000 → exact 交叉乗算 tax*1000 == base*25（除算・丸めなし）。独立 spec は定数・被演算子を独自に持ち、普遍的な可換性書き換えのみでカーネル橋渡し。
- C（整合）: zero / 1000→25 / 4000→100 / 1000→26 / 100→2 / 40→1,2 / impl↔spec 一致を全て `by decide` または普遍定理で確認、矛盾 0。
- U（範囲外）: 課税標準法人税額の算定・課税事業年度の判定・累積・納付期限・実数・負の値（Nat 前提）・他条項は NOT MODELLED。

注記: 本記録は機械的検証（worktree 外での再抽出・再計算・検出器実行）の結果であり、人間の法解釈レビューではない（LEGAL_REVIEW_PENDING; mechanical, not human review）。
