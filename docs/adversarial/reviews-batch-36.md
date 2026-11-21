### TaxAccountantPenaltyCap.lean — 税理士法 第六十四条

- 独立再抽出: doc-comment / transcription_audit.py / impl・spec・tests を一切信用せず、worktree 外 `D:\CodexData\Temp\_extract_tapc.py` の使い捨て Python が pinned 生 JSON を直接読み、自前 walker で `tag=Article` & `attr.Num="64"` を定位・正規化（`\s+` 除去）。実行後に一時スクリプトは削除済み。
- 一次資料: `data/raw/326AC1000000237_20251001_505AC0000000053.law.json`（law 326AC1000000237, revision 326AC1000000237_20251001_505AC0000000053, 法律, 昭和二十六年法律第二百三十七号）。
- SHA-256 再計算: `46d956e2c48954577ec3479c5e8c83a2a2ff913860a2ba6b2eea327f3107916f`（生バイト CRLF 正規化後も同一）。
- Article 定位: `Num="64"` を構造走査で 1 件検出、caption の有無に関わらず needle を含む正規化スコープ本文を取得。
- 逐語照合: needle「次の各号のいずれかに該当する者は、百万円以下の過料に処する。」は正規化スコープ本文に verbatim 1 回存在。読点・漢字を一字一句保持。
- 数値再計算（自前 kanji 十進パーサ）: 百万 → 1,000,000 円。以下 = inclusive `<=`。domain は Nat（円・整数）、「過料の額」を amount とする。
- 境界例 ≥3（自前再計算）: 999999 <= 1000000 → true（below）, 1000000 <= 1000000 → true（at cap,  inclusive）, 1000001 <= 1000000 → false（above）。矛盾 0。
- 検出器: `independent_spec_ok` True（独立定数 specPenaltyCap・独立演算子 `>` + 否定、impl 識別子なし。普遍定理 agreePenaltyCap が omega でカーネル橋渡し）、`boundary_evidence_categories` = {zero, small_input, saturation}、`spec_literals` = {1000000}、`source_literals_verified(spec_literals, scoped)` True（百万 を認識）。

判定: BY-DESIGN / CONFIRMED（原文の明示的な数値上限 百万円 と「以下」の含意のみをモデル化。各号の該当者、第五十三条/第五十九条違反、報告・検査的事実、拘留、他の項・条の法的判断は範囲外）。全 H で通過。

H/T/D/C/U（独立レビュー記録）:
- H（原条項）: 第六十四条の「百万円以下の過料」という明示的な数値上限と「以下」（inclusive）のみ。
- T（逐語性）: 自前再抽出の needle が正規化スコープ本文に verbatim 1 回存在。SHA-256 は生バイトから再計算。
- D（導出）: 百万 → 1,000,000。以下 → `<=`。独立 spec は定数・比較演算子（`>` + 否定）を独自に持ち、普遍 omega 定理のみでカーネル橋渡し。
- C（整合）: zero / 1 / 999999 / 1000000 / 1000001 / saturation / impl↔spec 一致を全て `by decide` または定理適用で確認。境界 1000000 採用・1000001 除外を確認。
- U（範囲外）: 各号の列挙、第五十三条/第五十九条違反、報告・検査、拘留、他の項・条、実数・負の値（Nat 前提）、実際の科刑判断は NOT MODELLED。

注記: 本記録は機械的検証（worktree 外での再抽出・再計算・検出器実行）の結果であり、人間の法解釈レビューではない（LEGAL_REVIEW_PENDING）。
