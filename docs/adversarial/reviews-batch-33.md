### PetroleumGasFineRange.lean — 石油ガス税法 第二十七条

- 独立再抽出: doc-comment / transcription_audit.py / impl・spec・tests を一切信用せず、pinned raw JSON を worktree 外 `D:\CodexData\Temp\_pgas_reextract.py` の一時 Python が直接読み、自前 walker で `tag=Article` & `attr.Num="27"` を定位・正規化（`[\s\u3000]+` 除去）。実行後に一時スクリプトは削除。
- 一次資料: `data/raw/340AC0000000156_20260525_506AC0000000052.law.json`（law 340AC0000000156, revision 340AC0000000156_20260525_506AC0000000052, 石油ガス税法）。
- SHA-256 再計算: `537d080b0297f777c2ef10a5b7439b00c09cb6dfe1c28c40fdfeac346f36f153`（raw bytes、134296 bytes）。
- Article 定位: `Num="27"` を 1 件検出（正規化スコープ本文 454 文字）。誤定位なし。
- 逐語照合: 針「前項の犯罪に係る課税石油ガスに対する石油ガス税に相当する金額の三倍が五十万円を超える場合には、情状により、同項の罰金は、五十万円を超え当該石油ガス税に相当する金額の三倍以下とすることができる。」は正規化スコープ本文に verbatim 1 回存在。
- 数値再計算（独立 Python の自前 kanji パーサ: 三→3, 五十万→500000）: fineUpper tax = 3*tax, fineFloor = 500000。境界: tax=166666→499998 (≤500000, 非適用); tax=166667→500001 (>500000, 適用); fine=500000 除外 (超え strict); fine=500001 採用; fine=500001=fineUpper 採用 (以下 inclusive); over-cap 500002 除外。impl と一致。
- 検出器: `independent_spec_ok` True（独立定式 `specApplies`/`specWithin` は `>` / strict `<`+`+1`、impl 識別子なし。普遍定理 `agree_range`/`agree_within` が omega で橋渡し）、`boundary_evidence_categories` = {zero, small_input, saturation}、`spec_literals` = {3, 500000}、`source_literals_verified(spec_literals, scoped)` True、`review_ok` True。

判定: BY-DESIGN / CONFIRMED（原文の明示的な数値条件と罰金範囲のみをモデル化。「情状により」の裁量、犯罪成立要件、他の条項・徴収手続は範囲外）。全 H で通過。

H/T/D/C/U（独立レビュー記録）:
- H（原条項）: 第二十七条の「三倍が五十万円を超える場合…五十万円を超え…三倍以下」の数値条件・罰金範囲のみ。
- T（逐語性）: 自前再抽出の針が正規化スコープ本文に verbatim 1 回存在。読点・括弧・漢字を一字一句保持。
- D（導出）: 「三倍」→3、「五十万円」→500000、「超え」→strict `<`、「以下」→inclusive `<=`。impl は Nat/Bool、独立 spec は `>` と strict `<`+`+1` という異なる表面演算子を用い、普遍定理 + omega でカーネル橋渡し。
- C（整合）: zero/small positive/tax 166666・166667/fine 500000・500001/fine=fineUpper/over-cap/impl-spec 一致を全て `by decide`。単調性は omega の直接不等式で検証。
- U（範囲外）: 「情状により」の裁量、犯罪の成立要件、他の条項・附則・徴収手続、負の金額（Nat 前提）は NOT MODELLED。

注記: 本記録は機械的検証（再抽出・再計算・検出器実行）の結果であり、人間のレビューではない（LEGAL_REVIEW_PENDING）。
