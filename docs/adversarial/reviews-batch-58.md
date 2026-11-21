# Adversarial review — batch 58

### RegistrationTaxTruncation30k.lean — 登録免許税法施行規則 第二十九条

- 独立再抽出: doc-comment / impl・spec・tests を一切信用せず、pinned 生 JSON を worktree 外 `D:\CodexData\Temp\opencode\_r30k_verify.py` の一時 Python が直接読み、自前 walker で `tag=Article` & `attr.Num="29"` を定位・正規化（`[\s\u3000]+` 除去）。一時スクリプトは repo 外、repo 未変更。
- 一次資料（正式名称の補正 = BY-DESIGN / CONFIRMED）: `data/raw/342CO0000000146_20261001_507CO0000000124.law.json`。見出し「登録免許税法施行規則」は指示どおり維持、source `revision_info.law_title` / INVENTORY `official_title` は **登録免許税法施行令**（CabinetOrder, 令和七年政令第百二十四号）。
- Revision: `current_revision_status=CurrentEnforced`（施行 2026-10-01）、INVENTORY の `current_revision` と `raw_snapshot.source_file` が `342CO0000000146_20261001_507CO0000000124` で一致 → pin のまま CONFIRMED。
- SHA-256: 生バイト 178197 から `0fc3f9ca8c85fa0dbafec4de836a9c1cbf7153c01e58f01b25995aa29ec9aa2b` を再計算（INVENTORY の大文字 pin と同一）→ CONFIRMED。
- Article 定位: `Num="29"` を 1 件（第二十九条, caption （印紙納付ができる場合）, 正規化スコープ本文 505 文字）。誤定位なし。
- 逐語照合: 針「登記等につき課されるべき登録免許税の額の三万円未満の端数の部分の登録免許税を納付する場合」はスコープ Article 29（第二号）に verbatim 1 回（原文全体でも 1 回）→ CONFIRMED。
- 数詞: 三万円 = 3 × 10^4 = 30000 円。`kanji_variants(30000)` に三万を含み `source_literals_verified({30000}, scoped)` True → CONFIRMED。
- 境界（≥3）: below 29999→0；at 30000→30000；above 30001→30000；zero 0→0、small 1/2→0、45000→30000、60000→60000。by-decide 全件を Python シミュレーションし矛盾 0 → CONFIRMED。
- 検出器: `independent_spec_ok` True（spec は独自定数 `specUnit=30_000` と同一演算子を自記述、spec 式に impl 識別子なし）、`spec_literals`={30000}、`boundary_evidence_categories`={threshold_below, threshold_at, threshold_above, zero, small_input, saturation}（3 threshold カテゴリすべて）、`source_literals_verified` True → CONFIRMED。
- 橋渡し（axiom-free, 完全形）:
  ```lean
  theorem agreeTruncate (amount : Nat) : truncate30k amount = specTruncate amount := by
    unfold truncate30k specTruncate truncUnit specUnit
    rfl
  ```
  純 `unfold ... ; rfl` のみ。by_cases / omega / Classical.choice / 追加公理なし → CONFIRMED。
- 範囲外: 印紙納付の可否（第一号・第三号）、公示・認定、端数以外の税額算定、他条・附則、司法判断は NOT MODELLED。ThousandYenTruncation（¥1,000, art.5）と同一パターンの ¥30,000 版（別法令）。

判定: BY-DESIGN / CONFIRMED（原文の明示的な数値切捨て「三万円未満の端数」のみをモデル化。全 H で通過）。

H/T/D/C/U（独立レビュー記録）:
- H（原条項）: 第二十九条第二号「…登録免許税の額の三万円未満の端数…」の明示的数値のみ。
- T（逐語性）: 自前再抽出の針が Article 29 スコープ本文に verbatim 1 回、SHA-256 再計算が pin と一致。
- D（導出）: 三万円→30000 円、角捨て DOWN = `amount - amount % 30000`。impl と spec は同一演算子を各定数で記述し、`agreeTruncate`（純 rfl）が普遍橋渡し。
- C（整合）: 0/1/2/29999/30000/30001/45000/60000 で impl=spec、全境界一致、矛盾 0。
- U（範囲外）: 印紙納付の該当性・公示・認定・端数以外の算定・他条項・法的判断は NOT MODELLED。

補正記録（BY-DESIGN / CONFIRMED）:
1. 名称: 見出し「登録免許税法施行規則」→ 正式「登録免許税法施行令」（source `law_title` 準拠）。見出しは指示どおり維持。
2. 注記: 本記録は機械的検証（再抽出・SHA-256 再計算・検出器実行・by-decide 例の Python シミュレーション）の結果であり、人間の法解釈レビューではない（LEGAL_REVIEW_PENDING; mechanical, not human review）。
