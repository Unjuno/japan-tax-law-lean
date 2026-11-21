# Adversarial review — batch 50

### TwoStageVotingThreshold.lean — 税理士法施行令 第九条

- 独立再抽出: doc-comment / impl・spec・tests を一切信用せず、worktree 外の使い捨て Python が pinned 生 JSON を直接読み、自前 walker で `tag=Article` & `attr.Num="9"` を定位（`law_full_text` 配下に構造ヒット、needle は当該 Article の Paragraph[Num=1] → Sentence[Num=1] に verbatim 1 回、全文でも 1 回、生バイト 83151）し、原文照合。実行後に一時スクリプトは削除済み。
- 一次資料: `data/raw/326CO0000000216_20240401_505CO0000000146.law.json`（law 326CO0000000216 税理士法施行令, CabinetOrder, revision 326CO0000000216_20240401_505CO0000000146, enforcement 2024-04-01）。
- SHA-256 再計算: `346e24c2512be9a2ef3524e48a54b67b3bff30d1d81468f69e3f39b92cf8d296`（生バイトから再計算）→ CONFIRMED。
- Article 定位: `Num="9"` を構造走査で検出 → CONFIRMED。
- 逐語照合: needle「税理士会の総会の議事は、会員の二分の一以上の者が出席し、その出席者の過半数で決するものとし、可否同数のときは、議長の決するところによる。」は当該 Article 内に verbatim 1 回、全文でも 1 回（FOUND）→ CONFIRMED。
- 数詞再計算: 二分の一 = 1/2（原文の「二」を直接照合）。impl `quorumMet` の被演算子 `2 * present >= total` と spec `specHalfDen = 2` が一致 → CONFIRMED。`過半数` は STRICT `>`、`以上` は INCLUSIVE `>=` で二段階を区別 → CONFIRMED。
- 境界照合 (≥3 カテゴリ): zero (0/0, 1/0, 0 attendees) → false、small_input/boundary (quorum 1/2 true, 0/2 false, 1/3 false, 2/3 true; majority 2/3 true, 1/2 false, 2/4 false, 3/5 true)、tie (yes*2 == present: 1/2, 2/4 → false)、saturation (2*1=2, 2-2=0)。矛盾 0 → CONFIRMED。
- 依頼例の修正: 依頼文の `quorum (1,3) true` は 2*1=2 < 3 で false、`majority (2,2) false [tie]` は 2*2=4 > 2 で true（満場一致であり同数ではない）。真の yes=2 同数は (2,4)。pinned 数式と Python シミュレーションに従い kernel が決定する値を採用 → CONFIRMED。
- 検出器: `independent_spec_ok` True（spec は独自定数 specHalfDen=2 と独自の 2 式のみで、独立 def に impl 識別子なし。普遍定理 agreeQuorum / agreeMajority は unfold 後の純粋 `rfl` で by_cases/omega/Classical.choice 不使用）、`boundary_evidence_categories` = {zero, small_input, boundary, tie, saturation}（≥3）、`spec_literals` = {2}、`source_literals_verified` True → CONFIRMED。
- 橋渡し: agreeQuorum は `unfold quorumMet specQuorum specHalfDen` + `rfl`、agreeMajority は `unfold majorityFor specMajority specHalfDen` + `rfl` のみ。specHalfDen を 2 に展開すると両本体は構文的に同一となり、追加公理なしのカーネル橋渡し → CONFIRMED。
- 可否同数: 「議長の決するところによる」は数値規則を伴わないため範囲外（注記のみ、モデル化しない）。第九条第二項の三分の二、他の項・条も NOT MODELLED。

判定: BY-DESIGN / CONFIRMED（原文の明示的な二つの数値議決要件 —— 二分の一以上 = 包含 >= の定足数と過半数 = Strict > の賛成 —— のみをモデル化。全 H で通過）。

H/T/D/C/U（独立レビュー記録）:
- H（原条項）: 第九条第一項の「会員の二分の一以上の者が出席し、その出席者の過半数で決する」の二つの明示的直接数値条件 のみ。
- T（逐語性）: 自前再抽出の needle が当該 Article 内に verbatim 1 回。SHA-256 は生バイトから再計算。
- D（導出）: 二分の一 → 2 による cross-multiplication。impl は `2*present >= total` / `2*yes > present`、spec は独自 `specHalfDen=2`。橋渡しは普遍定理かつ純粋 `rfl` のみで公理を導入しない。
- C（整合）: 0/2/3/4/5 人、zero ガード、同数、saturation、impl↔spec 一致（全入力変数に対する普遍定理）を `by decide` または普遍定理で確認、矛盾 0。
- U（範囲外）: 可否同数の議長裁定（数値規則なし）、第九条第二項の三分の二、議事手続、実数・負の値（Nat 前提）、他条項は NOT MODELLED。

注記: 本記録は機械的検証（worktree 外での再抽出・再計算・検出器実行・by-decide 例の Python シミュレーション）の結果であり、人間の法解釈レビューではない（LEGAL_REVIEW_PENDING; mechanical, not human review）。
