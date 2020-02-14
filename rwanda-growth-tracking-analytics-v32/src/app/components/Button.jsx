import React from 'react';

const Button = ({ label, onClick, small, style, disabled = false }) => (
  <button
    id="noprint"
    style={{
      height: small ? '26px' : '42px',
      background: 'unset',
      cursor: 'pointer',
      backgroundColor: '#296596',
      color: 'white',
      fontSize: small ? '0.9rem' : '1.1rem',
      paddingLeft: small ? '0.5rem' : '1rem',
      paddingRight: small ? '0.5rem' : '1rem',
      border: 'none',
      ...style
    }}
    onClick={onClick}
    disabled={disabled}
  >
    {label}
  </button>
);

export default Button;
