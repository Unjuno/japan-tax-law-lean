### ClampedSubtraction.lean — 登録免許税法施行規則 第十二条

- 独立再抽出: doc-comment / transcription_audit.py / impl・spec・tests を一切信用せず、pinned raw JSON を worktree 外 `D:\CodexData\Temp\_clamped_reextract.py` の一時 Python が直接読み、自前 walker で `tag=Article` & `attr.Num="12"` を定位・正規化（`[\s\u3000]+` 除去）。実行後に一時スクリプトは削除。
- 一次資料: `data/raw/342M50000040037_20260401_508M60000040008.law.json`（law 342M50000040037, revision 342M50000040037_20260401_508M60000040008, 登録免許税法施行規則）。
- SHA-256 再計算: `5aba6032d0ed2f0060e623e1a7bd53c2248e7b5abcb9cb2b81c21e9ff443cc16`（raw bytes、175030 bytes）。
- Article 定位: `Num="12"` を 1 件検出（正規化スコープ本文 2539 文字）。誤定位なし。
- 逐語照合: 針「イに掲げる額からロに掲げる額を控除した額（当該控除した額が零を下回る場合にあつては、零）がイに掲げる額のうちに占める割合」は正規化スコープ本文に verbatim 1 回存在（raw 文字列でも 1 回）。
- 数値再計算（独立 Python の自前 clamp: `i-r if r<=i else 0`）: 5-10→0, 10-3→7, 10-10→0, 0-1→0, 10-0→10, 3-3→0, 1-0→1。impl の Nat 飽和減算と一致。
- 検出器: `independent_spec_ok` True（独立定式 `specClampedSubtract` は if-then-else、impl 識別子なし。普遍定理 `agreeClampedSubtract` が omega で橋渡し）、`boundary_evidence_categories` = {zero, small_input, saturation}、`review_ok` True。

判定: BY-DESIGN / CONFIRMED（原文の明示的な clamp-at-zero 控除のみをモデル化。末尾の「割合」は除算・丸め規則がこの断片に無く範囲外）。全 H で通過。

H/T/D/C/U（独立レビュー記録）:
- H（原条項）: 第十二条の「イに掲げる額からロに掲げる額を控除した額（当該控除した額が零を下回る場合にあつては、零）」のみ。末尾の「割合」は対象外。
- T（逐語性）: 自前再抽出の針が正規化スコープ本文に verbatim 1 回存在。読点・括弧・漢字を含む一字一句を保持。
- D（導出）: 「零を下回る場合は零」→ Nat の saturating subtraction（impl）および `if r <= i then i - r else 0`（独立 spec）。両者は普遍定理 + omega でカーネル橋渡し。
- C（整合）: 零入力、小正値、同値(10-10=0)、アンダーフロー(5-10=0, 0-1=0)、通常(10-3=7)、巨大数での飽和、isZero、impl/spec 一致を全て `by decide`。イに関する単調性は omega。
- U（範囲外）: 「割合」の計算（除算・丸め）、他の号・条、負の金額（Nat 前提）、附則の経過措置は NOT MODELLED。

注記: 本記録は機械的検証（再抽出・再計算・検出器実行）の結果であり、人間のレビューではない（LEGAL_REVIEW_PENDING）。
