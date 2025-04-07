import React, { useState } from 'react';
import ReactDOM from 'react-dom';
import MuiModal from './components/MuiModal';

// Reactアプリケーションのエントリーポイント
const App = () => {
  // モーダルの開閉状態を管理するステート
  const [isModalOpen, setModalOpen] = useState(false);

  return (
    <div>
      {/* モーダルを開くボタン */}
      <button className="custom-button" onClick={() => setModalOpen(true)}>
        Open MUI Modal
      </button>
      {/* MUIモーダルコンポーネントを使用 */}
      <MuiModal isOpen={isModalOpen} onClose={() => setModalOpen(false)}>
        <p>ここにモーダルの内容を記載します。</p>
      </MuiModal>
    </div>
  );
};

// DOMが読み込まれた後にReactアプリケーションをレンダリング
document.addEventListener('DOMContentLoaded', () => {
  const root = document.createElement('div'); // Reactのルート要素を作成
  root.id = 'react-root';
  document.body.appendChild(root); // ルート要素をDOMに追加
  ReactDOM.render(<App />, root); // Reactアプリケーションをレンダリング
});