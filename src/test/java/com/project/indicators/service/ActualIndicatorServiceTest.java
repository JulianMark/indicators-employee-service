package com.project.indicators.service;

import com.project.indicators.builder.IndicatorBuilder;
import com.project.indicators.mapper.ActuallyMapper;
import com.project.indicators.model.dto.IndicatorDTO;
import com.project.indicators.service.http.IndicatorRequest;
import com.project.indicators.service.http.IndicatorResponse;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Nested;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;


@DisplayName("Employee Actual Indicators Service Test")
class ActualIndicatorServiceTest {

    @Mock
    private ActuallyMapper actuallyMapper;

    @Mock
    private IndicatorBuilder indicatorBuilder;

    @InjectMocks
    private IndicatorsService sut;

    private final IndicatorRequest INVALID_REQUEST = new IndicatorRequest(0);
    private final IndicatorRequest VALID_REQUEST =  new IndicatorRequest(1);
    private final IndicatorDTO VALID_DTO = new IndicatorDTO(3f,800f,1f,6f,1f,null);

    @BeforeEach
    public void setUp(){
        MockitoAnnotations.initMocks(this);
    }

    @Nested
    @DisplayName("Should return 400 (Bad Request)")
    class ObtainActualIndicatorRequestTest {

        @Test
        @DisplayName("When Request is null")
        public void obtainActualIndicator_RequestIsNull_ReturnBadRequest(){
            ResponseEntity<IndicatorResponse> responseEntity = sut.obtainActualIndicator(null);
            assertThat("Status Code Response",
                    responseEntity.getStatusCode(),
                    is(HttpStatus.BAD_REQUEST));
        }

        @Test
        @DisplayName("When idEmployee is zero or less zero")
        public void obtainActualIndicator_IdEmployeeIsZeroOrLessZero_ReturnBadRequest(){
            ResponseEntity<IndicatorResponse> responseEntity = sut.obtainActualIndicator(INVALID_REQUEST);
            assertThat("Status Code Response",
                    responseEntity.getStatusCode(),
                    is(HttpStatus.BAD_REQUEST));
        }
    }

    @Nested
    @DisplayName("Should return 500 (Internal Server Error)")
    class ObtainActualInternalServerErrorTest {

        @Test
        @DisplayName("When ActuallyMapper throws Exception")
        public void ActualIndicator_ActuallyMapperThrowException_ReturnsInternalServerError(){
            when(actuallyMapper.obtainActually(any())).thenThrow(new RuntimeException ("something bad happened"));
            ResponseEntity<IndicatorResponse> responseEntity = sut.obtainActualIndicator(VALID_REQUEST);
            assertThat("Status Code Response",
                    responseEntity.getStatusCode(),
                    is(HttpStatus.INTERNAL_SERVER_ERROR));
        }
    }

    @Nested
    @DisplayName("Should return 204 (No Content)")
    class ObtainActualIndicatorNoContentTest {

        @Test
        @DisplayName("When DTO is null")
        public void obtainActualIndicator_DTOIsNull_ReturnsNonContent(){
            when(actuallyMapper.obtainActually(any())).thenReturn(null);
            ResponseEntity<IndicatorResponse> responseEntity = sut.obtainActualIndicator(VALID_REQUEST);
            assertThat("Status Code Response",
                    responseEntity.getStatusCode(),
                    is(HttpStatus.NO_CONTENT));
        }
    }

    @Nested
    @DisplayName("Should return 200 (OK)")
    class ObtainActualIndicatorStatusOKTest {

        @Test
        @DisplayName("When No Exception is Catched")
        public void obtainActualIndicator_NoExceptionCatched_ReturnsOk(){
            when(actuallyMapper.obtainActually(any())).thenReturn(VALID_DTO);
            when(indicatorBuilder.apply(VALID_DTO)).thenReturn(new IndicatorResponse());
            ResponseEntity<IndicatorResponse> responseEntity = sut.obtainActualIndicator(VALID_REQUEST);
            assertThat("Status Code Response",
                    responseEntity.getStatusCode(),
                    is(HttpStatus.OK));
        }
    }
}