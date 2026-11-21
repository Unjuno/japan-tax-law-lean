# Adversarial review — batch 51

### MaxLengthMultiplier115.lean — 船舶設備最大船長一・一五倍規制 第二十一条

- 独立再抽出: doc-comment / impl・spec・tests を一切信用せず、worktree 外の使い捨て Python が pinned 生 JSON を直接読み、自前 walker で `tag=Article` & `attr.Num="21"` を定位（`/law_full_text/children/1/children/3/children/1/children/19`、構造ヒット 1 件）し、原文照合。実行後に一時スクリプトは削除済み。
- 一次資料: `data/raw/342CO0000000146_20261001_507CO0000000124.law.json`（登録免許税法施行令, CabinetOrder, revision 342CO0000000146_20261001_507CO0000000124, enforcement 2026-10-01, 改正 令和七年政令第百二十四号）。
- SHA-256 再計算: `0fc3f9ca8c85fa0dbafec4de836a9c1cbf7153c01e58f01b25995aa29ec9aa2b`（生バイト 178197 から再計算）→ CONFIRMED。
- Article 定位: `Num="21"`、Caption （船舶の製造事業等に係る設備の拡張の許可で課税しないものの範囲）、Item 二 → CONFIRMED。
- 逐語照合: needle「最大船長（製造又は修繕をすることができる船舶の長さの最大値をいう。以下この号において同じ。）が、拡張許可前の当該設備における最大船長の一・一五倍を超えることとならないものであること」は当該 Article 内に verbatim 1 回、全文でも 1 回（FOUND）→ CONFIRMED。
- 数詞再計算: 一・一五 = 1.15 = 115/100（`kanji_variants(115)` が原文の「一・一五」に直接命中）。impl `100*after <= 115*before` と spec `after*100 <= before*115` は同じ有理境界 → CONFIRMED。「超えることとならない」= 包含 <=（等号許容）→ CONFIRMED。
- 境界照合 (≥3 カテゴリ): zero (0/0 true, 1/0 false, 0/1 true)、small_input (1/1, 2/2, 11/10 true; 12/10, 13/10 false — 1.15*10=11.5, inclusive integer ceiling 11)、saturation (100*115 = 115*100, 100*115 − 115*100 = 0, 100*0 = 0)、exact 1.15x (115/100 true, 116/100 false, 114/100 true)。矛盾 0 → CONFIRMED。
- 検出器: `independent_spec_ok` True（spec は独自定数 specNum=115 / specDen=100 と被演算子反転のみで、独立 def に impl 識別子なし。普遍定理 agreeWithin は unfold 後の純粋 `rw [Nat.mul_comm 100 after, Nat.mul_comm 115 before]` で by_cases/omega/Classical.choice 不使用）、`boundary_evidence_categories` = {zero, small_input, saturation}（≥3）、`spec_literals` = {115, 100}（115 含有）、`review_ok` True → CONFIRMED。
- source_literals_verified: 素の句（Item 二）単体では {115,100} に False（「一・一五」はあるが「百」が句内に無い）。scoped Article 21 全体では True（「一・一五」と「百」= 第百二十八号/第百二十九号 の二アンカー）。`clause_correspondence` は needle in clause + all literals in scoped article の二アンカー経由で成立 → BY-DESIGN / CONFIRMED（二桁十進数は特別扱いが必要）。
- 橋渡し: agreeWithin は `unfold withinLengthLimit specWithin multiplierNumer multiplierDenom specNum specDen` + `rw [Nat.mul_comm 100 after, Nat.mul_comm 115 before]` のみ。spec 本体 `after*100 <= before*115` が impl 本体 `100*after <= 115*before` に構文的に一致し、追加公理なしのカーネル橋渡し → CONFIRMED。
- 範囲外: 最大トン数 一・六倍（Item 一）、拡張許可の定義・手続、その他の条項、実数・負の値（Nat 前提）は NOT MODELLED。

判定: BY-DESIGN / CONFIRMED（原文の明示的な数値上限 一・一五倍 = 115/100 と「超えることとならない」= 包含 <= のみをモデル化。全 H で通過）。

H/T/D/C/U（独立レビュー記録）:
- H（原条項）: 第二十一条 Item 二の「最大船長の一・一五倍を超えることとならない」の明示的直接数値上限 のみ。
- T（逐語性）: 自前再抽出の needle が当該 Article 内に verbatim 1 回。SHA-256 は生バイトから再計算。
- D（導出）: 一・一五 → 115/100。impl は `decide (100*after <= 115*before)`、spec は `decide (after*100 <= before*115)`。橋渡しは普遍定理かつ純粋 `Nat.mul_comm` rewrite のみで公理を導入しない。
- C（整合）: (115,100) true / (116,100) false / (114,100) true / (0,0) true / (1,0) false、小入力、saturation、impl↔spec 一致を全て `by decide` または普遍定理で確認、矛盾 0。
- U（範囲外）: Item 一（最大トン数 一・六倍）、拡張許可の定義・手続、他条項、実数・負の値（Nat 前提）は NOT MODELLED。

注記: 本記録は機械的検証（worktree 外での再抽出・再計算・検出器実行・by-decide 例の Python シミュレーション）の結果であり、人間の法解釈レビューではない（LEGAL_REVIEW_PENDING; mechanical, not human review）。
