"use client";
import {
  IGetStudentResponse,
  IGetUserMeResponse,
  TTotalRegistransResponse,
} from "@uninus/entities";

export type ReturnTypesStudentData = {
  setStudent: (val: IGetStudentResponse | undefined) => void;
  getStudent: IGetStudentResponse | undefined;
};

export type ReturnTypesUserData = {
  setUser: (val: IGetUserMeResponse | undefined) => void;
  getUser: IGetUserMeResponse | undefined;
};

export type ReturnTypeUserEmail = {
  setEmail: (val: string) => void;
  getEmail: string;
};

export type ReturnTypesRegistransData = {
  setRegistransData: (val: TTotalRegistransResponse | undefined) => void;
  getRegistransData: TTotalRegistransResponse | undefined;
};
