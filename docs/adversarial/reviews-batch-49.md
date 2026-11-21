# Adversarial review — batch 49

### JointSignatureHeirThreshold.lean — 印紙税法施行令 第十条

- 独立再抽出: doc-comment / impl・spec・tests を一切信用せず、worktree 外の使い捨て Python が pinned 生 JSON を直接読み、自前 walker で `tag=Article` & `attr.Num="10"` を定位（構造ヒット 1 件、law_full_text → Article[Num=10] → Paragraph[Num=5] → ParagraphSentence → Sentence[Num=1]）し、原文照合。実行後に一時スクリプトは削除済み。
- 一次資料: `data/raw/342CO0000000108_20250401_507CO0000000006.law.json`（law 342CO0000000108, CabinetOrder, revision 342CO0000000108_20250401_507CO0000000006, enforcement 2025-04-01）。
- SHA-256 再計算: `fcd1097f54737de069b8289eda6e6326e566926b2a03375cb16ad9cc69ace8d1`（生バイトから再計算）→ CONFIRMED。
- Article 定位: `Num="10"` を構造走査で 1 件検出 → CONFIRMED。
- 逐語照合: needle「相続人が二人以上ある場合には、前項の申告書は、各相続人が連署して提出するものとする。」は当該 Article ノード内に verbatim 1 回、全文でも 1 回（判定: FOUND）→ CONFIRMED。
- 数詞再計算: 二人 = 2（原文の漢数字「二」を直接照合）。impl `heirThreshold` / spec `specThreshold` = 2 と一致 → CONFIRMED。
- 境界照合 (≥3): 0 → false、1 → false、2 → true（包含 >=）、3 → true。saturation（2 − 2 = 0）および impl↔spec 一致も全点で確認、矛盾 0 → CONFIRMED。
- 検出器: `independent_spec_ok` True（spec は独自定数 specThreshold=2 と被演算子反転 `¬ heirs < specThreshold` のみで、独立 def に impl 識別子なし。普遍定理 agreeRequired は unfold 後の純粋 `simp [Nat.not_lt]` で by_cases/omega/Classical.choice 不使用）、`boundary_evidence_categories` = {zero, small_input, saturation}（≥3）、`spec_literals` = {2}、`source_literals_verified` True（原文の「二人」を直接照合）→ CONFIRMED。
- 橋渡し: agreeRequired の本体は `unfold jointSignatureRequired specRequired heirThreshold specThreshold` + `simp [Nat.not_lt]` のみ。Nat.not_lt により `¬ heirs < 2` → `2 <= heirs`（= `heirs >= 2`）へ書き換わり、追加公理なしのカーネル橋渡し → CONFIRMED。

判定: BY-DESIGN / CONFIRMED（原文の明示的な直接数値条件 二人 = 2 人と「以上」= 包含 >= のみをモデル化。連署要件は派生 Bool  flag `jointSignatureRequired` として表現。前項の申告書・各相続人・連署して提出する行為・手続詳細・他条項は範囲外）。全 H で通過。

H/T/D/C/U（独立レビュー記録）:
- H（原条項）: 第十条「相続人が二人以上ある場合には、前項の申告書は、各相続人が連署して提出するものとする。」の明示的直接数値条件 二人以上 のみ。
- T（逐語性）: 自前再抽出の needle が当該 Article 内に verbatim 1 回。SHA-256 は生バイトから再計算。
- D（導出）: 二人 → 2。 impl は `decide (heirs >= 2)`、spec は `decide (¬ heirs < 2)`。橋渡しは普遍定理かつ `simp [Nat.not_lt]` のみで公理を導入しない。
- C（整合）: 0 / 1 / 2 / 3 人、小入力、saturation、impl↔spec 一致を全て `by decide` または普遍定理で確認、矛盾 0。
- U（範囲外）: 前項の申告書・各相続人・連署して提出する行為・手続詳細・実数・負の値（Nat 前提）・他条項は NOT MODELLED。

注記: 本記録は機械的検証（worktree 外での再抽出・再計算・検出器実行・by-decide 例の Python シミュレーション）の結果であり、人間の法解釈レビューではない（LEGAL_REVIEW_PENDING; mechanical, not human review）。
