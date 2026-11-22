# Adversarial review — batch 62

### RatioCapAtOne.lean — 施行条例 第八条の三（割合の一を超える場合の容量）

- 独立再抽出: doc-comment / impl・spec・tests を一切信用せず、worktree 外の使い捨て Python が pinned 生 JSON を直接読み、自前 walker で `tag=Article` & `attr.Num="8_3"` を定位（`/law_full_text/children/1/children/3/children/1/children/9`、構造ヒット 1 件）し、Paragraph 2 / Item 二 / Sentence から原文を抽出・照合。実行後に一時スクリプトは削除済み。
- 一次資料: `data/raw/407CO0000000029_20110101_422CO0000000058.law.json`（law_type=CabinetOrder, revision `407CO0000000029_20110101_422CO0000000058`）。見出しの「施行条例」は queue label の略称であり、正式名称は `revision_info.law_title` = 阪神・淡路大震災の被災者等に係る国税関係法律の臨時特例に関する法律施行令（法律施行令 / 政令、条例ではない）。revision も source と一致 → BY-DESIGN / CONFIRMED。
- SHA-256 再計算: `8cc12128db2332ce354b4cfa48b167f6911c61af813bdc7974e832081097b7f4`（生バイト 577283 から再計算）→ CONFIRMED。
- Article 定位: `Num="8_3"`、ArticleTitle 第八条の三、Caption（有限会社の最低資本金を満たすまでの資本増加に係る出資の払込みに充てる利益の配当の非課税）→ CONFIRMED。
- 逐語照合: needle「当該社員が出資の引受けをした金額に、イに掲げる金額がロに掲げる金額のうちに占める割合（当該割合が一を超える場合には、一とする。）を乗じて計算した金額」は当該 Article 内に verbatim 1 回、全文でも 1 回（FOUND）→ CONFIRMED。
- 数詞再計算: 一 = 1 = 容量上限（`kanji_variants(1)` が原文の「一」に直接命中）。「一を超える場合には、一とする」= 包含キャップ: num > den なら 1、num = den は 1 のまま。impl `min num den` と spec `min num den` は同じ実効分子 → CONFIRMED。
- BY-DESIGN 入力契約: den = ロに掲げる金額 > 0 は比 num/den が定義されるための scoping 仮定。モデルは除算を持たず `min num den` のみなので、den = 0 は想定入力域外として文書化するのみ（Nat 前提の依存型 precondition は置かない）→ BY-DESIGN / CONFIRMED。
- 境界照合 (≥3 カテゴリ): zero (0/5 → 0, 0/1 → 0)、small_input (1,2,3,5)、threshold_below (L-1 = 0)、threshold_at (L = 1: 1/1 → 1)、threshold_above (L+1 = 2: 2/1 → 1, 2/3 → 2)、above (5/3 → 3)、below (3/5 → 3)、large (1_000_000/999_999 → 999_999)。矛盾 0 → CONFIRMED。
- 検出器: `independent_spec_ok` True（spec は独自定数 specCap=1 / 独自定式 specCapped=min を持ち、独立 def に impl 識別子なし。普遍定理 agreeCap / agreeCapped は unfold 後の純粋 `rfl` のみで by_cases/omega/Classical.choice 不使用）、`boundary_evidence_categories(tests, {1})` = {zero, small_input, saturation, threshold_below, threshold_at, threshold_above}（≥3）、`spec_literals` の静的リテラルは {1}（一）、`source_literals_verified({1}, scoped)` True、`review_ok` True → CONFIRMED。※ 現行 in-tree の `spec_literals()` は `v > 1` を除外するため実抽出値は空集合; 静的リテラル 1（一）の原文字照合は `kanji_variants(1)` / `source_literals_verified({1}, …)` で別途確認（BY-DESIGN / CONFIRMED）。
- 橋渡し: agreeCap は `unfold capValue specCap` + `rfl`、agreeCapped は `unfold cappedRatio specCapped capValue specCap` + `rfl`。impl 本体と spec 本体は unfold 後に構文的に一致し、追加公理なしのカーネル橋渡し → CONFIRMED。
- 範囲外: 利益配当の金額・非課税要件、有限会社法第十二条第二項、所得税法施行令第百十一条、出資口数、その他の条項、実数・負の値（Nat 前提）は NOT MODELLED。

判定: BY-DESIGN / CONFIRMED（原文の明示的な数値上限「一」= 1 と「超える場合には一とする」の包含キャップ、および den > 0 の scoping 仮定のみをモデル化。全 H で通過）。

H/T/D/C/U（独立レビュー記録）:
- H（原条項）: 第八条の三 Paragraph 2 Item 二の「割合（当該割合が一を超える場合には、一とする。）」の明示的直接数値上限「一」のみ。
- T（逐語性）: 自前再抽出の needle が当該 Article 内に verbatim 1 回。SHA-256 は生バイトから再計算。
- D（導出）: 一 → 1。impl も spec も `min num den`。橋渡しは二つの普遍定理いずれも純粋 `unfold ... ; rfl` のみで公理を導入しない。
- C（整合）: (5,3)=3 / (3,5)=3 / (3,3)=3 / (0,5)=0 / (1,1)=1 / (2,1)=1 / (2,3)=2、impl↔spec 一致を全て `by decide` または普遍定理で確認、矛盾 0。
- U（範囲外）: 利益配当・出資要件・他条項・実数・負の値（Nat 前提）は NOT MODELLED。

注記: 本記録は機械的検証（worktree 外での再抽出・再計算・検出器実行・by-decide 例の Python シミュレーション）の結果であり、人間の法解釈レビューではない（LEGAL_REVIEW_PENDING; mechanical, not human review）。
