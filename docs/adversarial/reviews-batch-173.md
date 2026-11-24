# Adversarial review — batch 173

## Scope

Mechanical (not human) re-extraction of the pinned source artifact for
HeiseiFY7Attribution.lean and its independent Spec/Tests modules. All claims
below are reproducible from committed bytes.

### HeiseiFY7Attribution.lean — 公債収入 第二条（平成7年度所属の歳入）

BY-DESIGN / CONFIRMED — 独立再抽出（一次資料）による照合・判定。

- 独立再抽出: impl / spec / tests の doc-comment と transcription pin を一切信用せず、使い捨て Python が `data/raw/408AC0000000002_19960223_000000000000000.law.json` を直接読み、自前 walker で全ツリー走査・SHA 再計算・漢字パースを実施。一時スクリプトはレビュー後に削除。
- 一次資料: law 408AC0000000002, revision 408AC0000000002_19960223_000000000000000.
- SHA-256（CRLF→LF 正規化）: 実測 `3ff89a7a62e99caa577bf83a447ae1836cdbbcfc778caf6686316921fef52a5f` = impl ヘッダ pin 一致。CONFIRMED。
- Article Num: 2 (第二条), MAIN provision; scoped Article 2 = 202 chars, Num==2 は 1 箇所のみ。
- Needle verbatim in scoped Article 2（照合一致）:
  「この場合において、同年四月一日以後発行される同条の公債に係る収入は、平成七年度所属の歳入とする。」
- Statutory literal 七 = 7 (attributedFY / specFY) は needle 内に verbatim 存在。`parse_statutory_rate` is None（率ではない）。`source_literals_verified({7}, scoped)` = True。CONFIRMED。
- 境界カテゴリ (>=3): zero (0), small_input (6/7/8), threshold_below (6), threshold_at (7), threshold_above (8) — すべて kernel-decided examples。
- 独立仕様: specFY / specBelongs は実装識別子なしで定義。`independent_spec_ok` = True、`spec_literals` = {7}。
- Bridges: agreeFY / agreeBelongs は `unfold ... ; rfl` のみ。

H/T/D/C/U（独立レビュー記録）:

- H（反証可能仮説）: 所属の歳入は 平成7年度 の EXACT year (fy == 7) であり、6/8/0 はことごとく false になる。
- T（再生・実出力）: Python で belongsToAttributedFY / specBelongs を再実装し 7=true, 6=false, 8=false, 0=false を確認。`boundary_evidence_categories(tests,{7})` = {zero, small_input, threshold_below, threshold_at, threshold_above}（5 カテゴリ）。
- D（判定）: **PASS / CONFIRMED**。SHA・needle・Article 2・リテラル 7・5 境界カテゴリすべて一致。証明は rfl / by decide のみ。
- C（競合説明）: 「四月一日以後発行」を年度範囲や発行日条件としてモデル化する誤読を検査。本モデルは明示的年の帰属のみを対象とし、周辺年 (6/8) で false となることで単一年であることを確認。
- U（不確実性）: 本環境に Lean バイナリがなく実カーネル実行は未実施（静的読了と Python 模擬のみ）。公債発行詳細・収入額・他条は NOT MODELLED。法的正当性は一切主張しない。

### 判定（verdict）

**NO CONCRETE DEFECT FOUND。** BY-DESIGN / CONFIRMED。本レビューは機械的・経験的検証の記録であり、人間の法的レビューに代わるものではない（mechanical, not human / LEGAL_REVIEW_PENDING / NO LEGAL CORRECTNESS CLAIM）。
