# Adversarial review — batch 57

### CrossSection15mm.lean — 不当廉売関税政令 第一条（横断面寸法）

- 独立再抽出: doc-comment / impl・spec・tests を一切信用せず、worktree 外 `D:\CodexData\Temp\opencode\_cs15_verify.py` / `_cs15_check.py` の使い捨て Python が pinned 生 JSON を直接読み、自前 walker で `tag=Article` & `attr.Num="1"` を定位・正規化（`[\s\u3000]+` 除去）。一時スクリプトは repo 外に置き、repo は変更していない。
- 一次資料（正式名称の補正 = BY-DESIGN / CONFIRMED）: `data/raw/504CO0000000372_20221208_000000000000000.law.json`。見出し「不当廉売関税政令」は略称であり、source の `revision_info.law_title` / `INVENTORY.json` の `official_title` は **溶融亜鉛めっき鉄線に対して課する不当廉売関税に関する政令**（令和四年政令第三百七十二号, CabinetOrder, 条見出し （課税物件））。見出し文字列は指示どおり維持し、正式名称は本文で補正記録する。
- Revision の確定（BY-DESIGN / CONFIRMED）: 指示の revision 欄は空（—）だったが、実 source の `current_revision_status=CurrentEnforced`（施行 2022-12-08）と `INVENTORY.json` の `current_revision` / `raw_snapshot.source_file` がいずれも `504CO0000000372_20221208_000000000000000` で一致。これを current-enforced として pin（補正不要、差し替えなし）。
- SHA-256 再計算: 生バイト 14675 から `8a24107aeb9a8ae677da410191e847ff53d533744e39ea187e9e8a7f3bc0041a` を再計算（INVENTORY の大文字 pin `8A24107A...41A` と同一）→ CONFIRMED。
- Article 定位: `Num="1"` を 1 件検出（正規化スコープ本文 804 文字）。誤定位なし。
- 逐語照合: 針「横断面の最大寸法が一・五ミリメートルを超えるもの」は正規化スコープ Article 1 本文に verbatim 1 回存在（生 JSON 全体では 2 回、いずれも同一文字列）。読点・漢字を一字一句保持 → CONFIRMED。
- 数詞再計算: 一・五ミリメートル = 1.5 mm = 15 tenths（scale 10、浮動小数なし）。`kanji_variants(15)` に **一・五** を含む。`source_literals_verified({15}, scoped)` = True → CONFIRMED。
- 境界（≥3 カテゴリ）: below 14 tenths → false；at 15 tenths（= 一・五, strict 超えで除外）→ false；above 16 tenths → true。さらに zero 0 → false、small 1/2 → false、saturation 17/100 → true。by-decide 例を Python で全件シミュレーションし矛盾 0 → CONFIRMED。
- 検出器: `independent_spec_ok` True（spec は独自定数 `specThreshold=15`・独立演算子 `specExceeds = decide (specThreshold < t)` を自記述、spec 式に impl 識別子 `dimensionTenths` / `exceedsCrossSection` なし）、`spec_literals` = {15}、`boundary_evidence_categories(tests, literals={15})` = {threshold_below, threshold_at, threshold_above, zero, small_input, saturation}（3 つの threshold カテゴリすべてを含有、≥3）、`source_literals_verified({15}, scoped)` True → CONFIRMED。
- 橋渡し（厳密な証明、axiom-free）:
  ```
  theorem agreeExceeds (t : Nat) : exceedsCrossSection t = specExceeds t := by
    unfold exceedsCrossSection specExceeds dimensionTenths specThreshold
    rfl
  ```
  純粋な `unfold ... ; rfl` のみ。定数を展開すると両辺は定義的に同一項になり反射で閉じる。by_cases / omega / Classical.choice / 追加公理なし → CONFIRMED。
- 範囲外: 貨物の号（第一号〜第三号）、原産国、輸入期間、関税率、めっき工程、他項・他条項・他法令、法的判断は NOT MODELLED。

判定: BY-DESIGN / CONFIRMED（原文の明示的な十進しきい値「一・五ミリメートルを超える」のみをモデル化。全 H で通過）。

H/T/D/C/U（独立レビュー記録）:
- H（原条項）: 第一条の「横断面の最大寸法が一・五ミリメートルを超えるもの」の明示的十進しきい値（15 tenths = 1.5 mm）のみ。
- T（逐語性）: 自前再抽出の針が Article 1 スコープ本文に verbatim 1 回。SHA-256 は生バイトから再計算し pin と一致。
- D（導出）: 一・五 = 15/10 mm = 15 tenths（scale 10, 浮動小数なし）、超える = STRICT `>`（`dimensionTenths < t`）。impl と spec は同一の `<` 演算子をそれぞれの定数で記述。
- C（整合）: 14→false / 15→false / 16→true / 0→false、小さい正の入力、saturation、impl↔spec 一致を普遍定理 `agreeExceeds`（純 rfl）で確認、矛盾 0。
- U（範囲外）: 号区分・原産国・期間・関税率・めっき工程・他条項・法的判断は NOT MODELLED。

補正記録（いずれも BY-DESIGN / CONFIRMED）:
1. 名称: 見出し「不当廉売関税政令」→ 正式名称「溶融亜鉛めっき鉄線に対して課する不当廉売関税に関する政令」（source `law_title` に準拠）。見出しは指示どおり維持。
2. Revision: 指示欄が空のため、実 source の current-enforced `504CO0000000372_20221208_000000000000000` を pin。INVENTORY と一致、差し替え不要。
3. 注記: 本記録は機械的検証（worktree 外での再抽出・SHA-256 再計算・検出器実行・by-decide 例の Python シミュレーション）の結果であり、人間の法解釈レビューではない（LEGAL_REVIEW_PENDING; mechanical, not human review）。
