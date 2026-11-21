# Adversarial review — batch 48

### ImportValueCap200k.lean — 関税定率法施行令 第十三条の六

- 独立再抽出: doc-comment / impl・spec・tests を一切信用せず、worktree 外の使い捨て Python が pinned 生 JSON を直接読み、自前 walker で `tag=Article` & `attr.Num="13_6"` を定位（構造ヒット 1 件、law_full_text → Paragraph[Num=1] → TableStruct → TableRow[3] → TableColumn[2] → Sentence）し、原文照合。実行後に一時スクリプトは削除済み。
- 一次資料: `data/raw/329CO0000000155_20260401_508CO0000000085.law.json`（law 329CO0000000155, CabinetOrder, revision 329CO0000000155_20260401_508CO0000000085, enforcement 2026-04-01）。
- SHA-256 再計算: `7f76960b6510a6bd086c236c7d7facf5e47cb276f24a3f4a705c0c0aa8e15d01`（生バイトから再計算）→ CONFIRMED。
- Article 定位: `Num="13_6"` を構造走査で 1 件検出 → CONFIRMED。
- 逐語照合: needle「輸入する者ごとに財務省令で定めるところにより計算した輸入する物品の額の総額が二十万円を超えない範囲内において財務省令で定める額以下である場合における当該輸入する物品以外のもの」（87 文字）は当該 Article ノード内に verbatim 1 回（判定: FOUND）→ CONFIRMED。
- 数詞再計算: 二十万 = 200,000（自前の 万 対応 kanji→int 変換器で検算、2×10^5）。impl `valueCap` / spec `specCap` = 200_000 と一致 → CONFIRMED。
- 境界照合 (≥3): 0 → true、1 / 2 → true、199,999 → true、200,000 → true（包含 <=）、200,001 → false。saturation（200,000 − 200,000 = 0）および impl↔spec 一致も全点で確認、矛盾 0 → CONFIRMED。
- 検出器: `independent_spec_ok` True（spec は独自定数 specCap=200_000 と被演算子反転 `¬ specCap < amount` のみで、独立 def に impl 識別子なし。普遍定理 agreeWithin は unfold 後の純粋 `simp [Nat.not_lt]` で by_cases/omega/Classical.choice 不使用）、`boundary_evidence_categories` = {zero, small_input, saturation}（≥3）、`spec_literals` = {200000}、`source_literals_verified` True（原文の「二十万」を 万 対応変換器で直接照合）→ CONFIRMED。
- 橋渡し: agreeWithin の本体は `unfold withinCap specWithin valueCap specCap` + `simp [Nat.not_lt]` のみ。Nat.not_lt により `¬ 200000 < amount` → `amount <= 200000` へ書き換わり、追加公理なしのカーネル橋渡し → CONFIRMED。

判定: BY-DESIGN / CONFIRMED（原文の明示的な直接数値上限 二十万円 = 200,000 円と「超えない」= 包含 <= のみをモデル化。additional 「財務省令で定める額以下」は別個の非数値条件、計算方法・物品区分・行為者・他条項は範囲外）。全 H で通過。

H/T/D/C/U（独立レビュー記録）:
- H（原条項）: 第十三条の六の表下欄「輸入する物品の額の総額が二十万円を超えない」という明示的直接数値上限のみ。
- T（逐語性）: 自前再抽出の 87 文字 needle が当該 Article 内に verbatim 1 回。SHA-256 は生バイトから再計算。
- D（導出）: 二十万 → 200,000。impl は `<=`、spec は `¬ specCap < amount`。橋渡しは普遍定理かつ `simp [Nat.not_lt]` のみで公理を導入しない。
- C（整合）: 0 / 199,999 / 200,000 / 200,001 円、小入力、saturation、impl↔spec 一致を全て `by decide` または普遍定理で確認、矛盾 0。
- U（範囲外）: 「財務省令で定める額以下」の委任条件・計算方法・物品区分・行為者・実数・負の値（Nat 前提）・他条項は NOT MODELLED。

注記: 本記録は機械的検証（worktree 外での再抽出・再計算・検出器実行・by-decide 例の Python シミュレーション）の結果であり、人間の法解釈レビューではない（LEGAL_REVIEW_PENDING; mechanical, not human review）。
