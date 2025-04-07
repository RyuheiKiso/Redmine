import React from 'react';
import { Modal, Box, Typography, Button } from '@mui/material';

// MUIのモーダルコンポーネントを定義
const MuiModal = ({ isOpen, onClose, children }) => {
  // モーダルのスタイルを定義
  const style = {
    position: 'absolute',
    top: '50%',
    left: '50%',
    transform: 'translate(-50%, -50%)',
    width: 400,
    bgcolor: 'background.paper',
    boxShadow: 24,
    p: 4,
    borderRadius: '8px',
  };

  return (
    // MUIのModalコンポーネントを使用
    <Modal open={isOpen} onClose={onClose}>
      <Box sx={style}>
        {/* モーダルのタイトルを表示 */}
        <Typography variant="h6" component="h2">
          モーダルのタイトル
        </Typography>
        {/* モーダルの内容を表示 */}
        <Typography sx={{ mt: 2 }}>{children}</Typography>
        {/* 閉じるボタン */}
        <Button onClick={onClose} sx={{ mt: 2 }} variant="contained" color="primary">
          閉じる
        </Button>
      </Box>
    </Modal>
  );
};

export default MuiModal;