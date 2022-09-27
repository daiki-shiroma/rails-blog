import React from "react";
import styled from "styled-components";

export const HelloMessage = (props) => {
    const { headlineText } = props;
  
    const HeadlineSC = styled.h3`
      text-align: center;
      font-size: 42px;
    `;
    return <HeadlineSC>{headlineText}</HeadlineSC>;
  };