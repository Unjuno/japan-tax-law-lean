# Independent adversarial review — CustomsItExceptionPromptEffective

Produced by a second, independent re-extraction path (fresh Python JSON walk and hash recomputation), because delegated adversarial subagents are unavailable (usage limit).

### CustomsItExceptionPromptEffective.lean — 税関手続改正政令 附則第一条ただし書（第十三条は公布日施行）

独立再抽出により原文・施行版・ハッシュをヘッダーではなくスナップショットから再計算し、実装・仕様・証明を照合した。H/T/D/C/U の各軸で判定する。

- **H（反証可能仮説）**: 第十三条の規定は公布の日から施行される（遅延ゼロ）。これが誤りなら、needle の位置・条番号・法令のいずれかが一致しない。
- **T（再現検査）**: 生データ `420CO0000000210_20081001_000000000000000.law.json`（7,522 bytes）の SHA-256 を再計算し `499b4ac1…6aaba` を得た（ヘッダー一致）。独立 JSON walk で needle は substring 1 回・exact leaf 1 回（パス `law_full_text/children[1]/children[4]/children[1]/children[2]/children[1]/children[1]/children[0]`）。`children[4]` は SupplProvision、末尾 `children[1]` はただし書 Sentence。Title は正式名と一致、`CurrentEnforced`。
- **D（合否）**: PASS。原文に数値はなく、`spec_literals` は空。空の数値リテラル軸を PASS とは言わず、原文対応は verbatim pin のみで担保する。遅延ゼロを model 化し、1 日・2 日の遅延を closed example で棄却する。
- **C（対立解釈）**: ただし書を延期施行と読む説は `one_day_false` / `two_days_false` により棄却。実装名を仕様が再利用する循環はなく `independent_spec_ok = True`。仕様は後継者シフトによる別定式を用い、普遍定理を definitionally equal としてカーネル検証した。
- **U（不確かさ）**: 原文転写の忠実性のみ。第十三条の実体内容、一般の延期規則、他の附則条項は未モデル化のまま保留（`LEGAL_REVIEW_PENDING`）。

追加確認: `example` 宣言 6 件、境界カテゴリ 3 種、禁止トークン 0 件、`#print axioms` により定理が公理非依存。

**判決**: 具体的な欠陥は検出されなかった。法的正确性の主張ではない。人間の法的レビューは保留とする。
