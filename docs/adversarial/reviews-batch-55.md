# Adversarial review — batch 55

### EmploymentDuration6Months.lean — 酒税法施行規則 第十一条の八

- 独立再抽出: doc-comment / impl・spec・tests を一切信用せず、一時 Python が pinned 生 JSON を直接読み、自前 walker で `tag=Article` & `attr.Num="11_8"` を定位（11_2 … 11_20 を含む Article 一覧を確認、構造ヒットはちょうど 1 件）、葉を逐語照合。命中箇所は 第十一条の八（見出し （酒類販売管理者の選任））の 第三号。実行後に一時スクリプトは worktree 外（`D:\CodexData\Temp\opencode`）に置き、repo は変更していない。
- 一次資料（正式名称の補正 = BY-DESIGN / CONFIRMED）: `data/raw/328M50000040011_20260901_506M60000040032.law.json`。見出しの短縮名「酒税法施行規則」は正式名称ではなく、`revisions.json` / `INVENTORY.json` / `reference_stats.json` の `law_title` は **酒税の保全及び酒類業組合等に関する法律施行規則**（略称 酒団法施行規則 / 酒類業組合法施行規則, kana しゅぜいのほぜんおよびしゅるいぎょうくみあいとうにかんするほうりつしこうきそく）。law_num = 昭和二十八年大蔵省令第十一号, law_type = MinisterialOrdinance（省令）。見出し文字列は指示どおり維持し、正式名称は本文で補正記録する。
- Revision の確定（BY-DESIGN / CONFIRMED）: キューメタデータが古い可能性に備え、実在するソースファイル自体を確認。`INVENTORY.json` の `current_revision` / `raw_snapshot.source_file`、`reference_stats.json` の `law_revision_id`、`revisions.json` の `current_revision_status=CurrentEnforced`、`docs/LAW_STATUS.md`、`_sel*.json` のメタデータ、および実ファイル名がいずれも `328M50000040011_20260901_506M60000040032`（施行日 2026-09-01, 改正 令和六年財務省令第三十二号, amendment_law_id 506M60000040032）で一致。よって real current-enforced snapshot を `328M50000040011_20260901_506M60000040032` に pin する。補正不要（全メタデータ整合）。なお `remain_in_force=false` は全リビジョンに付く項目であり、権威ある状態フィールドは `current_revision_status=CurrentEnforced` である点を記録する。
- SHA-256 再計算: 生バイト 150853 から `d93f1c0211998c35e8acbc78620fe736df6b53d3b289ac1ee903a9b8b4543e3b` を再計算（INVENTORY の大文字 pin `D93F1C0211998C35E8ACBC78620FE736DF6B53D3B289AC1EE903A9B8B4543E3B` と同一）→ CONFIRMED。
- Article 定位: `Num="11_8"`（第十一条の八, 見出し （酒類販売管理者の選任））、第三号の文字葉 → CONFIRMED。
- 逐語照合: needle「酒類小売業者に引き続き六月以上の期間継続して雇用されることが予定されている者」は当該 Article 内に verbatim 1 回、全文でも 1 回（FOUND）→ CONFIRMED。
- 数詞再計算: 六月 = 6（月, Nat）。`kanji_variants(6) = {六}` を確認。「以上」は INCLUSIVE なので `months >= 6`（ちょうど 6 月で成立）であり、STRICT `> 6` ではない。`source_literals_verified({6}, scoped)` = True → CONFIRMED。
- 境界（≥3 カテゴリ）: below (<6): 0,1,2,3,4,5 → false；at (=6): 6 → true（以上 = inclusive）；above (>6): 7,8,12,18,100 → true。impl↔spec 一致を境界グリッド全域（0..199）で確認、矛盾 0。単調性は直接不等式 `meetsDurationFloor_of_ge`（`months >= 6` かつ `months <= months'` ⇒ `months' >= 6`、`Monotone` 不使用）→ CONFIRMED。
- 検出器: `independent_spec_ok` True（spec は独自定数 `specFloor` と impl と異なる演算子 `decide (¬ months < specFloor)` を独自に記述、spec 式に impl 識別子 `durationFloor` / `meetsDurationFloor` なし）、`spec_literals` = {6}（原文の 六 と一致）、`boundary_evidence_categories` ≥3（below / at / above）、`source_literals_verified` True → CONFIRMED。
- 橋渡し（厳密な証明、axiom-free）:
  ```
  theorem agreeDuration (months : Nat) : meetsDurationFloor months = specMeets months := by
    unfold meetsDurationFloor specMeets durationFloor specFloor
    simp [Nat.not_lt]
  ```
  純粋な `simp [Nat.not_lt]` のみ。`Nat.not_lt` が `¬ months < 6` を `6 <= months` へ書き換え、impl の `months >= 6`（= `6 <= months`）と同じカーネル項になる。by_cases / omega / Classical.choice / 追加公理なし → CONFIRMED。
- 範囲外: 同条の他の選任要件（選任時期、欠けたときの選任、生計を一にする親族、他販売場での選任、研修要件、ただし書）、法第八十六条の九、他項・他条項、月未満の端数（Nat 前提）は NOT MODELLED。

判定: BY-DESIGN / CONFIRMED（原文の明示的数値条件「六月以上」= 継続雇用期間 >= 6 月（inclusive）のみをモデル化。全 H で通過）。

H/T/D/C/U（独立レビュー記録）:
- H（原条項）: 第十一条の八 第三号の「六月以上の期間継続して雇用されることが予定されている者」の明示的数値条件（継続雇用期間の下限 6 月）のみ。
- T（逐語性）: 自前再抽出の needle が当該 Article 内に verbatim 1 回。SHA-256 は生バイトから再計算し pin と一致。
- D（導出）: 六月 = 6 月（Nat）；「以上」= inclusive `>=`。impl は `decide (months >= durationFloor)`、spec は `decide (¬ months < specFloor)`（異なる演算子）で独立に記述。
- C（整合）: 5 → false；6 → true；7 → true；impl↔spec 一致を普遍定理 `agreeDuration` と境界グリッドで確認、矛盾 0。
- U（範囲外）: 他の選任要件・ただし書・法第八十六条の九・他条項・端数は NOT MODELLED。

補正記録（いずれも BY-DESIGN / CONFIRMED）:
1. 名称: 見出しの「酒税法施行規則」→ 正式名称「酒税の保全及び酒類業組合等に関する法律施行規則」（一次資料の `law_title` に準拠）。
2. Revision: 実在ソースを精査し `328M50000040011_20260901_506M60000040032` を current-enforced として pin。全メタデータと一致し、古いスナップショットへの差し替えは不要（補正値の記載なし＝確認のみ）。
3. 注記: 本記録は機械的検証（worktree 外での再抽出・SHA-256 再計算・検出器実行・by-decide 例の Python シミュレーション）の結果であり、人間の法解釈レビューではない（LEGAL_REVIEW_PENDING; mechanical, not human review）。
