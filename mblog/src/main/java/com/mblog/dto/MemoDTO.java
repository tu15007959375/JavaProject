package com.mblog.dto;

import lombok.Data;
import org.springframework.validation.annotation.Validated;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import static com.mblog.utils.ConstUtils.*;

@Data
@Validated
public class MemoDTO {
    private Integer id;
    @NotBlank(message = MEMO_NAME_NOT_BLANK)
    private String name;
    @NotBlank(message = MEMO_DATE_NOT_BLANK)
    private String date;
    @NotNull(message =MEMO_TAG_NOT_NULL)
    private Integer tag;
    @NotNull(message = MEMO_STATUS_NOT_NULL)
    private Integer status;
}
