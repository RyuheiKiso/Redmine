import React from 'react';
import ReactDOM from 'react-dom';

const Modal = ({ isOpen, onClose, children }) => {
  if (!isOpen) return null;

  return ReactDOM.createPortal(
    <div className="modal">
      <div className="modal-content">
        <button className="close" onClick={onClose}>
          &times;
        </button>
        {children}
      </div>
    </div>,
    document.body
  );
};

export default Modal;