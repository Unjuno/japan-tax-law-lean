# Adversarial review — batch 61

### TonnageExpansionRatioCap.lean — 登録免許税法施行令 第二十一条（設備拡張のトン数比率）

- 独立再抽出: doc-comment / impl・spec・tests を一切信用せず、worktree 外の使い捨て Python が pinned 生 JSON を直接読み、自前 walker で `tag=Article` & `attr.Num="21"` を定位（`/law_full_text/children/1/children/3/children/1/children/19`、構造ヒット 1 件）し、原文照合。実行後に一時スクリプトは削除済み。
- 一次資料: `data/raw/342CO0000000146_20261001_507CO0000000124.law.json`（登録免許税法施行令, CabinetOrder, revision 342CO0000000146_20261001_507CO0000000124, enforcement 2026-10-01, 改正 令和七年政令第百二十四号）。
- SHA-256 再計算: `0fc3f9ca8c85fa0dbafec4de836a9c1cbf7153c01e58f01b25995aa29ec9aa2b`（生バイト 178197 から再計算）→ CONFIRMED。
- Article 定位: `Num="21"`、Caption （船舶の製造事業等に係る設備の拡張の許可で課税しないものの範囲）、Item 一 → CONFIRMED。
- 逐語照合: needle「当該設備における最大トン数（製造又は修繕をすることができる船舶の総トン数の最大値をいう。以下この号において同じ。）が、拡張許可前の当該設備における最大トン数の一・六倍を超えることとならないものであること。」は当該 Article 内に verbatim 1 回、全文でも 1 回（FOUND）→ CONFIRMED。
- 数詞再計算: 一・六 = 1.6 = 16/10（`kanji_variants(16)` が原文の「一・六」に直接命中）。impl `10*after <= 16*before` と spec `10*after <= 16*before` は同じ有理境界 → CONFIRMED。「超えることとならない」= 包含 <=（等号許容）→ CONFIRMED。
- 境界照合 (≥3 カテゴリ): zero (0/0 true, 0/1 false, 100/0 true)、small_input (10/15, 10/16 true; 10/17 false)、threshold_below (15)、threshold_at (16)、threshold_above (17)、saturation (10*16 = 16*10)、exact 1.6x (100/160, 100/159 true; 100/161 false)。矛盾 0 → CONFIRMED。
- 検出器: `independent_spec_ok` True（spec は独自定数 specScaledRatio=16 / specScaleBase=10 を持ち、独立 def に impl 識別子なし。普遍定理 agreeRatio/agreeBase/agreeWithin は unfold 後の純粋 `rfl` のみで by_cases/omega/Classical.choice 不使用）、`boundary_evidence_categories` = {zero, small_input, threshold_below, threshold_at, threshold_above, saturation}（≥3）、`spec_literals` ⊇ {16}、`review_ok` True → CONFIRMED。
- source_literals_verified: scoped Article 21 全体で True（「一・六」= 16 と「十」= 10 の二アンカー; 十 は第百二十八号等に由来）。`clause_correspondence` は needle in clause + all literals in scoped article の二アンカー経由で成立 → BY-DESIGN / CONFIRMED。
- 橋渡し: agreeWithin は `unfold withinCap specWithin scaledRatio specScaledRatio scaleBase specScaleBase` + `rfl` のみ。impl 本体と spec 本体は unfold 後に構文的に一致し、追加公理なしのカーネル橋渡し → CONFIRMED。
- 範囲外: 最大船長 一・一五倍（Item 二）、拡張許可の定義・手続、その他の条項、実数・負の値（Nat 前提）は NOT MODELLED。

判定: BY-DESIGN / CONFIRMED（原文の明示的な数値上限 一・六倍 = 16/10 と「超えることとならない」= 包含 <= のみをモデル化。全 H で通過）。

H/T/D/C/U（独立レビュー記録）:
- H（原条項）: 第二十一条 Item 一の「最大トン数の一・六倍を超えることとならない」の明示的直接数値上限 のみ。
- T（逐語性）: 自前再抽出の needle が当該 Article 内に verbatim 1 回。SHA-256 は生バイトから再計算。
- D（導出）: 一・六 → 16/10。impl も spec も `decide (10*after <= 16*before)`。橋渡しは三つの普遍定理いずれも純粋 `unfold ... ; rfl` のみで公理を導入しない。
- C（整合）: (100,160) true / (100,161) false / (100,159) true / (0,0) true / (0,1) false / (10,15) true / (10,16) true / (10,17) false、impl↔spec 一致を全て `by decide` または普遍定理で確認、矛盾 0。
- U（範囲外）: Item 二（最大船長 一・一五倍）、拡張許可の定義・手続、他条項、実数・負の値（Nat 前提）は NOT MODELLED。

注記: 本記録は機械的検証（worktree 外での再抽出・再計算・検出器実行・by-decide 例の Python シミュレーション）の結果であり、人間の法解釈レビューではない（LEGAL_REVIEW_PENDING; mechanical, not human review）。
