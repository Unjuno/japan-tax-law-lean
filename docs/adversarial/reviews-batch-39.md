# Adversarial review — batch 39

### TaxAccountantFineCap300k.lean — 税理士法 第六十二条

- 独立再抽出: doc-comment / transcription_audit.py / impl・spec・tests を一切信用せず、worktree 外 `D:\CodexData\Temp` の使い捨て Python が pinned 生 JSON を直接読み、自前 walker で `tag=Article` & `attr.Num="62"` を定位・正規化。実行後に一時スクリプトは削除済み。
- 一次資料: `data/raw/326AC1000000237_20251001_505AC0000000053.law.json`（law 326AC1000000237, revision 326AC1000000237_20251001_505AC0000000053）。
- SHA-256 再計算: `46d956e2c48954577ec3479c5e8c83a2a2ff913860a2ba6b2eea327f3107916f`（生バイト 454932 バイト）→ CONFIRMED。
- Article 定位: `Num="62"` を構造走査で 1 件検出、正規化スコープ本文 324 文字を取得 → CONFIRMED。
- 逐語照合: needle「次の各号のいずれかに該当する場合には、その違反行為をした者は、三十万円以下の罰金に処する。」は正規化 45 文字、正規化スコープ本文に verbatim 1 回存在（判定: FOUND）→ CONFIRMED。
- 数詞再計算: 三十万 = 300000。impl の fineCap=300_000、spec の specFineCap=300_000 と一致 → CONFIRMED。
- 境界照合 (≥3): 0 → true; 299,999 → true; 300,000 → true; 300,001 → false。impl↔spec 一致も全点で確認。矛盾 0 → CONFIRMED。
- 検出器: `independent_spec_ok` True（独立定数 specFineCap・独立演算子 `¬ specFineCap < amount`、impl 識別子なし。普遍定理 agreeWithin は `simp [Nat.not_lt]` の純粋書き換えで axiom-free、by_cases/omega/Classical.choice 不使用）、`boundary_evidence_categories` = {zero, small_input, saturation}、`spec_literals` = {300000}、`source_literals_verified(spec_literals, scoped)` True（三十万 = 300000 を認識）。

判定: BY-DESIGN / CONFIRMED（原文の明示的な数値上限 三十万円 = 300,000 円と「以下」= 包含 <= のみをモデル化。各号・参照条項・他の段落・他の条文・実際の量刑は範囲外）。全 H で通過。

H/T/D/C/U（独立レビュー記録）:
- H（原条項）: 第六十二条の「三十万円以下の罰金」という明示的な数値上限のみ。
- T（逐語性）: 自前再抽出の 45 文字 needle が正規化スコープ本文に verbatim 1 回存在。SHA-256 は生バイトから再計算。
- D（導出）: 三十万 → 300000。impl は `<=`、spec は `¬ specFineCap < amount`。橋渡しは普遍定理かつ `simp [Nat.not_lt]` のみで、追加公理を導入しない。
- C（整合）: zero / 299,999 / 300,000 / 300,001 / saturation / impl↔spec 一致を全て `by decide` または普遍定理で確認。
- U（範囲外）: 各号の違反事由・参照条項・他の段落・他の条文・実数・負の値（Nat 前提）は NOT MODELLED。

注記: 本記録は機械的検証（worktree 外での再抽出・再計算・検出器実行）の結果であり、人間の法解釈レビューではない（LEGAL_REVIEW_PENDING; mechanical, not human review）。
