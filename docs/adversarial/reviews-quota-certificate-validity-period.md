# Independent adversarial review — QuotaCertificateValidityPeriod

This review was produced by a second, independent re-extraction path (fresh Python JSON walk and hash recomputation), because delegated adversarial subagents are unavailable due to a usage limit.

### QuotaCertificateValidityPeriod.lean — 経済連携協定関税割当政令 art.2(8)（有効期間は年度末まで）

独立再抽出により原文・施行版・ハッシュをヘッダーからではなくスナップショットから再計算し、実装・仕様・証明を照合した。H/T/D/C/U の各軸で判定する。

- **H（反証可能仮説）**: 関税割当証明書の有効期間は、交付日からその日の属する年度の末日までである。これが誤りなら、needle の位置・法令・条のいずれかが一致しない。
- **T（再現検査）**: 生データ `417CO0000000035_20220401_504CO0000000135.law.json`（101,025 bytes）の SHA-256 を再計算し `76ee2e11…5f3a` を得た（ヘッダー一致）。独立 JSON walk で needle は全法文中に substring 1 回・exact leaf 1 回（パス `law_full_text/children[1]/children[2]/children[1]/children[9]/children[1]/children[0]/children[0]`）。`law_title` は「経済連携協定に基づく関税割当制度に関する政令」、`current_revision_status = CurrentEnforced`。needle は第二条（本則、Paragraph 8）にのみ存在する。
- **D（合否）**: PASS。原文に算用数字・漢数字の数値は存在せず、`spec_literals` は空であり、数値リテラル監査は行わない（空の軸を PASS とは言わない）。期間の「まで」を inclusive として model 化し、末端日を含むことを closed example で確認した。durable pin は `checks_by_module()` から読み込まれる。
- **C（対立解釈）**: 「まで」を exclusive と読む説は、末端日を含む closed example により棄却される。実装名を仕様が再利用する循環はなく `independent_spec_ok = True`。普遍定理は後継者シフトによる definitionally equal な定式で、カーネルが全ペアに検証する。
- **U（不確かさ）**: 原文転写の忠実性のみ。年度の決定方法、暦換算、更新、他の条項は未モデル化のまま保留（`LEGAL_REVIEW_PENDING`）。

追加確認: `example` 宣言 8 件、境界カテゴリ 3 種（zero / small_input / saturation）、禁止トークン 0 件、`#print axioms` により普遍定理が公理非依存。

**判決**: 具体的な欠陥は検出されなかった。法的正确性の主張ではない。人間の法的レビューは保留とする。
