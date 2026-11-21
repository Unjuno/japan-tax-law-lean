### AccessoryPriceFloor.lean — 自家用自動車の一時輸入に関する通関条約の実施に伴う関税法等の特例に関する法律施行令 第二条

- 独立再抽出: doc-comment / transcription_audit.py を信用せず、pinned raw JSON から一時 Python（worktree 外 D:\CodexData\Temp）で再抽出。実行後に一時スクリプトは削除。
- 一次資料: `data/raw/339CO0000000182_20030401_415CO0000000142.law.json`（339CO0000000182, revision 339CO0000000182_20030401_415CO0000000142）。
- SHA-256 再計算: `086ef9dd9fc2f555fa952772e0be9e7f93f94f6decd7925e103490542331c0e6` — inventory の source_sha256 と一致。
- Article 定位: `law_full_text` を走査し `tag=Article` かつ `attr.Num="2"` を 1 件検出（第二条）。正規化（空白除去）スコープ本文は 205 字。
- 逐語照合: 針 `前二号に掲げるもののほか、車両の附属品であつて価格が一万円以上のもの` は正規化スコープ本文に verbatim 存在（旧仮名「あつて」を保持）。
- 数値再計算: 漢字数詞デコーダで「一万」= 10,000 を独立算出 → floor = 10_000 と一致。「以上」は inclusive (>=)。
- >=3 境界再計算: 9,999 → false / 10,000 → true / 10,001 → true（すべて pin 済み needle と同条から導出）。
- 検出器: independent_spec_ok True, boundary_evidence_categories = {zero, small_input, saturation}, spec_literals = {10000}, source_literals_verified(lits, scoped_article_text) True。

判定: BY-DESIGN / CONFIRMED（原条項の数値条件のみをモデル化。改変・拡張なし）。

H/T/D/C/U（独立レビュー記録）:
- H（原条項）: 第二条の当該号「車両の附属品であつて価格が一万円以上のもの」。
- T（逐語性）: 針が正規化スコープ本文に verbatim 存在。旧仮名・読点を含む一字一句を保持。
- D（導出）: 一万円 = 10,000（円, Nat）、以上 = 非 Narrow の >=。impl は `<=`、spec は `¬ <` を用い、普遍定理が omega / Nat.not_lt で橋渡し。
- C（整合）: 3 境界（9,999 / 10,000 / 10,001）で impl と spec が一致、単調性も omega で確認。
- U（範囲外）: 前二号、当該号がゲートする実質規定、他条、省令、一時輸入手続きは未モデル化。

注記: 本記録は機械的検証（再抽出・再計算・検出器実行）の結果であり、人間のレビューではない。
